# Flutter gRPC

A gRPC sample in flutter.

## Getting Started

Put all proto files under "protos/" Directory

Run this command : "protoc --dart_out=grpc:lib/core/grpc/generated protos/helloworld.proto"

The dart code will be generated here "lib/core/grpc/generated"