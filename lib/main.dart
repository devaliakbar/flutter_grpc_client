import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter gRPC Client Demo',
      home: Home(),
    );
  }
}
