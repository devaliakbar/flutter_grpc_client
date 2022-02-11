import 'package:grpc/grpc.dart';

class GrpcClientHelper {
  static const String defaultPath = "0.0.0.0";
  static const int defaultPort = 50051;

  static ClientChannel getChannel(
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
