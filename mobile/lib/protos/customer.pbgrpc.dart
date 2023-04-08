///
//  Generated code. Do not modify.
//  source: customer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'customer.pb.dart' as $0;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $2;
export 'customer.pb.dart';

class CustomerServiceClient extends $grpc.Client {
  static final _$createCustomer =
      $grpc.ClientMethod<$0.Customer, $1.StringValue>(
          '/customer.CustomerService/CreateCustomer',
          ($0.Customer value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$getCustomer = $grpc.ClientMethod<$1.StringValue, $0.Customer>(
      '/customer.CustomerService/GetCustomer',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Customer.fromBuffer(value));
  static final _$updateCustomer = $grpc.ClientMethod<$0.Customer, $2.Empty>(
      '/customer.CustomerService/UpdateCustomer',
      ($0.Customer value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$deleteCustomer = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/customer.CustomerService/DeleteCustomer',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$getCurrentCustomer = $grpc.ClientMethod<$2.Empty, $0.Customer>(
      '/customer.CustomerService/GetCurrentCustomer',
      ($2.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Customer.fromBuffer(value));

  CustomerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> createCustomer($0.Customer self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCustomer, self, options: options);
  }

  $grpc.ResponseFuture<$0.Customer> getCustomer($1.StringValue self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCustomer, self, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> updateCustomer($0.Customer self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateCustomer, self, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> deleteCustomer($1.StringValue self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteCustomer, self, options: options);
  }

  $grpc.ResponseStream<$0.Customer> getCurrentCustomer($2.Empty self,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getCurrentCustomer, $async.Stream.fromIterable([self]),
        options: options);
  }
}

abstract class CustomerServiceBase extends $grpc.Service {
  $core.String get $name => 'customer.CustomerService';

  CustomerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Customer, $1.StringValue>(
        'CreateCustomer',
        createCustomer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Customer.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.Customer>(
        'GetCustomer',
        getCustomer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.Customer value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Customer, $2.Empty>(
        'UpdateCustomer',
        updateCustomer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Customer.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'DeleteCustomer',
        deleteCustomer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.Customer>(
        'GetCurrentCustomer',
        getCurrentCustomer_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.Customer value) => value.writeToBuffer()));
  }

  $async.Future<$1.StringValue> createCustomer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Customer> self) async {
    return createCustomer(call, await self);
  }

  $async.Future<$0.Customer> getCustomer_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> self) async {
    return getCustomer(call, await self);
  }

  $async.Future<$2.Empty> updateCustomer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Customer> self) async {
    return updateCustomer(call, await self);
  }

  $async.Future<$2.Empty> deleteCustomer_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> self) async {
    return deleteCustomer(call, await self);
  }

  $async.Stream<$0.Customer> getCurrentCustomer_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> self) async* {
    yield* getCurrentCustomer(call, await self);
  }

  $async.Future<$1.StringValue> createCustomer(
      $grpc.ServiceCall call, $0.Customer self);
  $async.Future<$0.Customer> getCustomer(
      $grpc.ServiceCall call, $1.StringValue self);
  $async.Future<$2.Empty> updateCustomer(
      $grpc.ServiceCall call, $0.Customer self);
  $async.Future<$2.Empty> deleteCustomer(
      $grpc.ServiceCall call, $1.StringValue self);
  $async.Stream<$0.Customer> getCurrentCustomer(
      $grpc.ServiceCall call, $2.Empty self);
}
