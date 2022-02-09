import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/core/grpc/generated/greet.pbgrpc.dart';
import 'package:flutter_grpc_client/core/grpc/grpc_client.dart';

class Unary extends StatefulWidget {
  @override
  _UnaryState createState() => _UnaryState();
}

class _UnaryState extends State<Unary> {
  final TextEditingController _nameController = TextEditingController();
  final GrpcClient _grpcClient = GrpcClient();

  String serverRes = "";

  @override
  void dispose() {
    _nameController.dispose();
    _grpcClient.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unary"),
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
            Text(serverRes.isEmpty ? "" : "Response from server: " + serverRes)
          ],
        ),
      ),
    );
  }

  Future<void> callGrpc(String name) async {
    serverRes = "";
    final channel = _grpcClient.getChannel();
    final stub = GreetServiceClient(channel);

    try {
      final response = await stub.greet(
        GreetRequest(greeting: Greeting(firstName: name)),
      );

      setState(() {
        serverRes = response.result;
      });
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }
}
