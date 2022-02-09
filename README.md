# Flutter gRPC

A gRPC sample in flutter.

## Getting Started

Step 1: Install protoc, see the instructions on
[the Protocol Buffers website](https://developers.google.com/protocol-buffers/).

Step 2: Get the Dart protoc plugin by running

```sh
$ pub global activate protoc_plugin
```

and add `~/.pub-cache/bin` to your PATH

Step 3: Create proto files under "protos/" directory (example helloworld.proto)

Step 4: Run this command to generate dart files under "lib/core/grpc/generated" directory:

```sh
$ protoc --dart_out=grpc:lib/core/grpc/generated -Iprotos protos/helloworld.proto
```