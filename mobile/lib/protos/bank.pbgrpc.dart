///
//  Generated code. Do not modify.
//  source: bank.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'bank.pb.dart' as $0;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $2;
export 'bank.pb.dart';

class QiggyBankServiceClient extends $grpc.Client {
  static final _$createQiggyBank =
      $grpc.ClientMethod<$0.QiggyBank, $1.StringValue>(
          '/bank.QiggyBankService/CreateQiggyBank',
          ($0.QiggyBank value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$getQiggyBank =
      $grpc.ClientMethod<$1.StringValue, $0.QiggyBank>(
          '/bank.QiggyBankService/GetQiggyBank',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.QiggyBank.fromBuffer(value));
  static final _$updateQiggyBank = $grpc.ClientMethod<$0.QiggyBank, $2.Empty>(
      '/bank.QiggyBankService/UpdateQiggyBank',
      ($0.QiggyBank value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$deleteQiggyBank = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/bank.QiggyBankService/DeleteQiggyBank',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$listQiggyBanks =
      $grpc.ClientMethod<$2.Empty, $0.QiggyBankList>(
          '/bank.QiggyBankService/ListQiggyBanks',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.QiggyBankList.fromBuffer(value));

  QiggyBankServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> createQiggyBank($0.QiggyBank request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createQiggyBank, request, options: options);
  }

  $grpc.ResponseFuture<$0.QiggyBank> getQiggyBank($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getQiggyBank, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> updateQiggyBank($0.QiggyBank request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateQiggyBank, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> deleteQiggyBank($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteQiggyBank, request, options: options);
  }

  $grpc.ResponseStream<$0.QiggyBankList> listQiggyBanks($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listQiggyBanks, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class QiggyBankServiceBase extends $grpc.Service {
  $core.String get $name => 'bank.QiggyBankService';

  QiggyBankServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.QiggyBank, $1.StringValue>(
        'CreateQiggyBank',
        createQiggyBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.QiggyBank.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.QiggyBank>(
        'GetQiggyBank',
        getQiggyBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.QiggyBank value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QiggyBank, $2.Empty>(
        'UpdateQiggyBank',
        updateQiggyBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.QiggyBank.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'DeleteQiggyBank',
        deleteQiggyBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.QiggyBankList>(
        'ListQiggyBanks',
        listQiggyBanks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.QiggyBankList value) => value.writeToBuffer()));
  }

  $async.Future<$1.StringValue> createQiggyBank_Pre(
      $grpc.ServiceCall call, $async.Future<$0.QiggyBank> request) async {
    return createQiggyBank(call, await request);
  }

  $async.Future<$0.QiggyBank> getQiggyBank_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return getQiggyBank(call, await request);
  }

  $async.Future<$2.Empty> updateQiggyBank_Pre(
      $grpc.ServiceCall call, $async.Future<$0.QiggyBank> request) async {
    return updateQiggyBank(call, await request);
  }

  $async.Future<$2.Empty> deleteQiggyBank_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return deleteQiggyBank(call, await request);
  }

  $async.Stream<$0.QiggyBankList> listQiggyBanks_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async* {
    yield* listQiggyBanks(call, await request);
  }

  $async.Future<$1.StringValue> createQiggyBank(
      $grpc.ServiceCall call, $0.QiggyBank request);
  $async.Future<$0.QiggyBank> getQiggyBank(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> updateQiggyBank(
      $grpc.ServiceCall call, $0.QiggyBank request);
  $async.Future<$2.Empty> deleteQiggyBank(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$0.QiggyBankList> listQiggyBanks(
      $grpc.ServiceCall call, $2.Empty request);
}
