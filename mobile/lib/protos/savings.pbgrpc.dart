///
//  Generated code. Do not modify.
//  source: savings.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'savings.pb.dart' as $0;
import 'package:protobuf_google/protobuf_google.dart' as $1;
export 'savings.pb.dart';

class SavingsServiceClient extends $grpc.Client {
  static final _$addSavings = $grpc.ClientMethod<$0.Savings, $1.StringValue>(
      '/savings.SavingsService/AddSavings',
      ($0.Savings value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$getSavings = $grpc.ClientMethod<$1.StringValue, $0.Savings>(
      '/savings.SavingsService/GetSavings',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Savings.fromBuffer(value));
  static final _$listSavings =
      $grpc.ClientMethod<$0.ListSavingsRequest, $0.SavingsList>(
          '/savings.SavingsService/ListSavings',
          ($0.ListSavingsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SavingsList.fromBuffer(value));

  SavingsServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> addSavings(
      $async.Stream<$0.Savings> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$addSavings, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.Savings> getSavings($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSavings, request, options: options);
  }

  $grpc.ResponseStream<$0.SavingsList> listSavings(
      $0.ListSavingsRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listSavings, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class SavingsServiceBase extends $grpc.Service {
  $core.String get $name => 'savings.SavingsService';

  SavingsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Savings, $1.StringValue>(
        'AddSavings',
        addSavings,
        true,
        false,
        ($core.List<$core.int> value) => $0.Savings.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.Savings>(
        'GetSavings',
        getSavings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.Savings value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListSavingsRequest, $0.SavingsList>(
        'ListSavings',
        listSavings_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.ListSavingsRequest.fromBuffer(value),
        ($0.SavingsList value) => value.writeToBuffer()));
  }

  $async.Future<$0.Savings> getSavings_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return getSavings(call, await request);
  }

  $async.Stream<$0.SavingsList> listSavings_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListSavingsRequest> request) async* {
    yield* listSavings(call, await request);
  }

  $async.Future<$1.StringValue> addSavings(
      $grpc.ServiceCall call, $async.Stream<$0.Savings> request);
  $async.Future<$0.Savings> getSavings(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$0.SavingsList> listSavings(
      $grpc.ServiceCall call, $0.ListSavingsRequest request);
}
