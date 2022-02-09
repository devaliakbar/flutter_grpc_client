# Flutter gRPC client

A gRPC client sample in flutter

See [gRPC server implmentation in go](https://github.com/devaliakbar/grpc_go/tree/master/greet).

## Getting Started

Step 1: Install protoc, see the instructions on
[the Protocol Buffers website](https://developers.google.com/protocol-buffers/).

Step 2: Get the Dart protoc plugin by running

```sh
$ pub global activate protoc_plugin
```

Step 3: Add `~/.pub-cache/bin` to your PATH

Step 4: Create proto files under "protos/" directory (example greet.proto)

Step 5: Run this command to generate dart files under "lib/core/grpc/generated" directory:

```sh
$ protoc --dart_out=grpc:lib/core/grpc/generated -Iprotos protos/greet.proto
```