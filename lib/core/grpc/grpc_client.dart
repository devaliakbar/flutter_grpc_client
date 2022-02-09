import 'package:grpc/grpc.dart';

class GrpcClient {
  static const String defaultPath = "localhost";
  static const int defaultPort = 50051;

  ClientChannel? _channel;

  ClientChannel getChannel(
      {String path = defaultPath, int port = defaultPort}) {
    _channel = ClientChannel(
      defaultPath,
      port: defaultPort,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    return _channel!;
  }

  void dispose() {
    if (_channel != null) {
      _channel!.terminate();
      _channel = null;
    }
  }
}
