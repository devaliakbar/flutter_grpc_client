# Flutter gRPC

A gRPC sample in flutter.

## Getting Started

Put all proto files under "protos/" Directory

Run this command to generate dart files under "lib/core/grpc/generated" directory:

```sh
$ protoc --dart_out=grpc:lib/core/grpc/generated -Iprotos protos/helloworld.proto
```