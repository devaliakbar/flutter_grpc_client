import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/core/grpc/generated/greet.pbgrpc.dart';
import 'package:flutter_grpc_client/core/grpc/grpc_client_helper.dart';
import 'package:grpc/grpc.dart';

class ClientStream extends StatefulWidget {
  @override
  _ClientStreamState createState() => _ClientStreamState();
}

class _ClientStreamState extends State<ClientStream> {
  final TextEditingController _nameController = TextEditingController();

  String request = "";
  String serverRes = "";

  ClientChannel? _channel;

  StreamController<LongGreetRequest>? greetStreamController;
  Stream<LongGreetRequest>? _greetStream;

  @override
  void dispose() {
    _nameController.dispose();

    _disposeChannel();

    super.dispose();
  }

  void _disposeChannel() {
    if (_channel != null) {
      _channel!.terminate();
      _channel = null;
    }

    if (_greetStream != null) {
      _greetStream = null;
    }

    if (greetStreamController != null) {
      greetStreamController!.close();
      greetStreamController = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client stream"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Enter name"),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.trim().isNotEmpty) {
                _send(_nameController.text.trim());

                if (request.isNotEmpty) {
                  request += ", ";
                } else {
                  request = "Requested :";
                }

                setState(() {
                  request += _nameController.text.trim();
                });

                FocusScope.of(context).requestFocus(FocusNode());
                _nameController.text = "";
              }
            },
            child: Text("Send"),
          ),
          SizedBox(
            height: 30,
          ),
          if (request.isNotEmpty) Text(request),
          SizedBox(
            height: 30,
          ),
          if (request.isNotEmpty)
            ElevatedButton(
              onPressed: _done,
              child: Text("Done"),
            ),
          if (serverRes.isNotEmpty) Text(serverRes),
        ],
      ),
    );
  }

  Future<void> _send(String req) async {
    try {
      if (_channel != null && greetStreamController != null) {
        serverRes = "";

        greetStreamController!
            .add(LongGreetRequest(greeting: Greeting(firstName: req)));
      } else {
        greetStreamController = StreamController<LongGreetRequest>();
        _greetStream = greetStreamController!.stream;

        _channel = GrpcClientHelper.getChannel();
        final stub = GreetServiceClient(_channel!);

        ///ADD CURRENT MESSAGE
        _send(req);
        final response = await stub.longGreet(_greetStream!);
        _disposeChannel();
        setState(() {
          serverRes = "Response from server: " + response.result;
        });
      }
    } catch (e) {
      print('Caught error: $e');
      _disposeChannel();
      serverRes = "";
      request = "";
    }
  }

  void _done() {
    setState(() {
      request = "";
    });

    if (greetStreamController != null) {
      greetStreamController!.close();
    }
  }
}
