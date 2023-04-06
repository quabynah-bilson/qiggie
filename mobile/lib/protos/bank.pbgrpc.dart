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

class PiggyBankServiceClient extends $grpc.Client {
  static final _$createPiggyBank =
      $grpc.ClientMethod<$0.PiggyBank, $1.StringValue>(
          '/bank.PiggyBankService/CreatePiggyBank',
          ($0.PiggyBank value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$getPiggyBank =
      $grpc.ClientMethod<$1.StringValue, $0.PiggyBank>(
          '/bank.PiggyBankService/GetPiggyBank',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.PiggyBank.fromBuffer(value));
  static final _$updatePiggyBank = $grpc.ClientMethod<$0.PiggyBank, $2.Empty>(
      '/bank.PiggyBankService/UpdatePiggyBank',
      ($0.PiggyBank value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$deletePiggyBank = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/bank.PiggyBankService/DeletePiggyBank',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$listPiggyBanks =
      $grpc.ClientMethod<$2.Empty, $0.PiggyBankList>(
          '/bank.PiggyBankService/ListPiggyBanks',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.PiggyBankList.fromBuffer(value));

  PiggyBankServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> createPiggyBank($0.PiggyBank request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPiggyBank, request, options: options);
  }

  $grpc.ResponseFuture<$0.PiggyBank> getPiggyBank($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPiggyBank, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> updatePiggyBank($0.PiggyBank request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePiggyBank, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> deletePiggyBank($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePiggyBank, request, options: options);
  }

  $grpc.ResponseStream<$0.PiggyBankList> listPiggyBanks($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listPiggyBanks, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class PiggyBankServiceBase extends $grpc.Service {
  $core.String get $name => 'bank.PiggyBankService';

  PiggyBankServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PiggyBank, $1.StringValue>(
        'CreatePiggyBank',
        createPiggyBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PiggyBank.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.PiggyBank>(
        'GetPiggyBank',
        getPiggyBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.PiggyBank value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PiggyBank, $2.Empty>(
        'UpdatePiggyBank',
        updatePiggyBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PiggyBank.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'DeletePiggyBank',
        deletePiggyBank_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.PiggyBankList>(
        'ListPiggyBanks',
        listPiggyBanks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.PiggyBankList value) => value.writeToBuffer()));
  }

  $async.Future<$1.StringValue> createPiggyBank_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PiggyBank> request) async {
    return createPiggyBank(call, await request);
  }

  $async.Future<$0.PiggyBank> getPiggyBank_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return getPiggyBank(call, await request);
  }

  $async.Future<$2.Empty> updatePiggyBank_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PiggyBank> request) async {
    return updatePiggyBank(call, await request);
  }

  $async.Future<$2.Empty> deletePiggyBank_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return deletePiggyBank(call, await request);
  }

  $async.Stream<$0.PiggyBankList> listPiggyBanks_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async* {
    yield* listPiggyBanks(call, await request);
  }

  $async.Future<$1.StringValue> createPiggyBank(
      $grpc.ServiceCall call, $0.PiggyBank request);
  $async.Future<$0.PiggyBank> getPiggyBank(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> updatePiggyBank(
      $grpc.ServiceCall call, $0.PiggyBank request);
  $async.Future<$2.Empty> deletePiggyBank(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$0.PiggyBankList> listPiggyBanks(
      $grpc.ServiceCall call, $2.Empty request);
}
