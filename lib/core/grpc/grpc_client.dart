import 'package:grpc/grpc.dart';

mixin GrpcClient {
  static const String defaultPath = "localhost";
  static const int defaultPort = 50051;

  ClientChannel getChannel(
      {String path = defaultPath, int port = defaultPort}) {
    return ClientChannel(
      defaultPath,
      port: defaultPort,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
  }
}
