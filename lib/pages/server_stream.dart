import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/core/grpc/generated/greet.pbgrpc.dart';
import 'package:flutter_grpc_client/core/grpc/grpc_client_helper.dart';
import 'package:grpc/grpc.dart';

class ServerStream extends StatefulWidget {
  @override
  _ServerStreamState createState() => _ServerStreamState();
}

class _ServerStreamState extends State<ServerStream> {
  final TextEditingController _nameController = TextEditingController();

  ClientChannel? _channel;

  List<String> _responseFromServer = [];

  @override
  void dispose() {
    _nameController.dispose();

    _disposeChannel();

    super.dispose();
  }

  Future<void> _disposeChannel() async {
    if (_channel != null) {
      await _channel!.terminate();
      _channel = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Server stream"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Enter your name"),
            ),
            SizedBox(
              height: 30,
            ),
            if (_channel == null)
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.trim().isNotEmpty) {
                    callGrpc(_nameController.text.trim());
                    FocusScope.of(context).requestFocus(FocusNode());
                    _nameController.text = "";
                  }
                },
                child: Text("Submit"),
              ),
            SizedBox(
              height: 30,
            ),
            if (_responseFromServer.isNotEmpty) Text("Response from server: "),
            Expanded(
              child: ListView.builder(
                itemCount: _responseFromServer.length,
                itemBuilder: (BuildContext context, int index) =>
                    Text(_responseFromServer[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> callGrpc(String name) async {
    _channel = GrpcClientHelper.getChannel();
    final stub = GreetServiceClient(_channel!);

    try {
      final GreetManyTimesRequest request =
          GreetManyTimesRequest(greeting: Greeting(firstName: name));

      await for (var res in stub.greetManyTimes(request)) {
        setState(() {
          _responseFromServer.add(res.response);
        });
      }
    } catch (e) {
      print('Caught error: $e');
    }

    await _disposeChannel();
    _responseFromServer.clear();
    setState(() {});
  }
}
