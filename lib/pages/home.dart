import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/pages/bidirection_stream.dart';
import 'package:flutter_grpc_client/pages/client_stream.dart';
import 'package:flutter_grpc_client/pages/server_stream.dart';
import 'package:flutter_grpc_client/pages/unary.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gRPC client demo"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Unary(),
                  ),
                );
              },
              child: Text("Unary request"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ServerStream(),
                  ),
                );
              },
              child: Text("Server stream"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ClientStream(),
                  ),
                );
              },
              child: Text("Client stream"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BidirectionStream(),
                  ),
                );
              },
              child: Text("Bidirection Stream"),
            )
          ],
        ),
      ),
    );
  }
}
