///
//  Generated code. Do not modify.
//  source: greet.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'greet.pb.dart' as $0;
export 'greet.pb.dart';

class GreetServiceClient extends $grpc.Client {
  static final _$greet = $grpc.ClientMethod<$0.GreetRequest, $0.GreetResponse>(
      '/greet.GreetService/Greet',
      ($0.GreetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GreetResponse.fromBuffer(value));
  static final _$greetManyTimes =
      $grpc.ClientMethod<$0.GreetManyTimesRequest, $0.GreetManyTimesResponse>(
          '/greet.GreetService/GreetManyTimes',
          ($0.GreetManyTimesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GreetManyTimesResponse.fromBuffer(value));
  static final _$longGreet =
      $grpc.ClientMethod<$0.LongGreetRequest, $0.LongGreetResponse>(
          '/greet.GreetService/LongGreet',
          ($0.LongGreetRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LongGreetResponse.fromBuffer(value));
  static final _$greetEveryone =
      $grpc.ClientMethod<$0.GreetEveryoneRequest, $0.GreetEveryoneResponse>(
          '/greet.GreetService/GreetEveryone',
          ($0.GreetEveryoneRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GreetEveryoneResponse.fromBuffer(value));
  static final _$greetDeadline =
      $grpc.ClientMethod<$0.GreetDeadlineRequest, $0.GreetDeadlineResponse>(
          '/greet.GreetService/GreetDeadline',
          ($0.GreetDeadlineRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GreetDeadlineResponse.fromBuffer(value));

  GreetServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GreetResponse> greet($0.GreetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$greet, request, options: options);
  }

  $grpc.ResponseStream<$0.GreetManyTimesResponse> greetManyTimes(
      $0.GreetManyTimesRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$greetManyTimes, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.LongGreetResponse> longGreet(
      $async.Stream<$0.LongGreetRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$longGreet, request, options: options).single;
  }

  $grpc.ResponseStream<$0.GreetEveryoneResponse> greetEveryone(
      $async.Stream<$0.GreetEveryoneRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$greetEveryone, request, options: options);
  }

  $grpc.ResponseFuture<$0.GreetDeadlineResponse> greetDeadline(
      $0.GreetDeadlineRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$greetDeadline, request, options: options);
  }
}

abstract class GreetServiceBase extends $grpc.Service {
  $core.String get $name => 'greet.GreetService';

  GreetServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GreetRequest, $0.GreetResponse>(
        'Greet',
        greet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GreetRequest.fromBuffer(value),
        ($0.GreetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GreetManyTimesRequest,
            $0.GreetManyTimesResponse>(
        'GreetManyTimes',
        greetManyTimes_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.GreetManyTimesRequest.fromBuffer(value),
        ($0.GreetManyTimesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LongGreetRequest, $0.LongGreetResponse>(
        'LongGreet',
        longGreet,
        true,
        false,
        ($core.List<$core.int> value) => $0.LongGreetRequest.fromBuffer(value),
        ($0.LongGreetResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GreetEveryoneRequest, $0.GreetEveryoneResponse>(
            'GreetEveryone',
            greetEveryone,
            true,
            true,
            ($core.List<$core.int> value) =>
                $0.GreetEveryoneRequest.fromBuffer(value),
            ($0.GreetEveryoneResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GreetDeadlineRequest, $0.GreetDeadlineResponse>(
            'GreetDeadline',
            greetDeadline_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GreetDeadlineRequest.fromBuffer(value),
            ($0.GreetDeadlineResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GreetResponse> greet_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GreetRequest> request) async {
    return greet(call, await request);
  }

  $async.Stream<$0.GreetManyTimesResponse> greetManyTimes_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GreetManyTimesRequest> request) async* {
    yield* greetManyTimes(call, await request);
  }

  $async.Future<$0.GreetDeadlineResponse> greetDeadline_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GreetDeadlineRequest> request) async {
    return greetDeadline(call, await request);
  }

  $async.Future<$0.GreetResponse> greet(
      $grpc.ServiceCall call, $0.GreetRequest request);
  $async.Stream<$0.GreetManyTimesResponse> greetManyTimes(
      $grpc.ServiceCall call, $0.GreetManyTimesRequest request);
  $async.Future<$0.LongGreetResponse> longGreet(
      $grpc.ServiceCall call, $async.Stream<$0.LongGreetRequest> request);
  $async.Stream<$0.GreetEveryoneResponse> greetEveryone(
      $grpc.ServiceCall call, $async.Stream<$0.GreetEveryoneRequest> request);
  $async.Future<$0.GreetDeadlineResponse> greetDeadline(
      $grpc.ServiceCall call, $0.GreetDeadlineRequest request);
}
