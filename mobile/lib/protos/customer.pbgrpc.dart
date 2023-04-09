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
  static final _$create_customer =
      $grpc.ClientMethod<$0.Customer, $1.StringValue>(
          '/customer.CustomerService/create_customer',
          ($0.Customer value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$get_customer = $grpc.ClientMethod<$1.StringValue, $0.Customer>(
      '/customer.CustomerService/get_customer',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Customer.fromBuffer(value));
  static final _$get_customer_by_username =
      $grpc.ClientMethod<$1.StringValue, $0.Customer>(
          '/customer.CustomerService/get_customer_by_username',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Customer.fromBuffer(value));
  static final _$update_customer = $grpc.ClientMethod<$0.Customer, $2.Empty>(
      '/customer.CustomerService/update_customer',
      ($0.Customer value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$delete_customer = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/customer.CustomerService/delete_customer',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$get_current_customer =
      $grpc.ClientMethod<$2.Empty, $0.Customer>(
          '/customer.CustomerService/get_current_customer',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Customer.fromBuffer(value));

  CustomerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> create_customer($0.Customer request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_customer, request, options: options);
  }

  $grpc.ResponseFuture<$0.Customer> get_customer($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_customer, request, options: options);
  }

  $grpc.ResponseFuture<$0.Customer> get_customer_by_username(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_customer_by_username, request,
        options: options);
  }

  $grpc.ResponseFuture<$2.Empty> update_customer($0.Customer request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_customer, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_customer($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_customer, request, options: options);
  }

  $grpc.ResponseStream<$0.Customer> get_current_customer($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_current_customer, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class CustomerServiceBase extends $grpc.Service {
  $core.String get $name => 'customer.CustomerService';

  CustomerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Customer, $1.StringValue>(
        'create_customer',
        create_customer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Customer.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.Customer>(
        'get_customer',
        get_customer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.Customer value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.Customer>(
        'get_customer_by_username',
        get_customer_by_username_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.Customer value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Customer, $2.Empty>(
        'update_customer',
        update_customer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Customer.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'delete_customer',
        delete_customer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $0.Customer>(
        'get_current_customer',
        get_current_customer_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($0.Customer value) => value.writeToBuffer()));
  }

  $async.Future<$1.StringValue> create_customer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Customer> request) async {
    return create_customer(call, await request);
  }

  $async.Future<$0.Customer> get_customer_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return get_customer(call, await request);
  }

  $async.Future<$0.Customer> get_customer_by_username_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return get_customer_by_username(call, await request);
  }

  $async.Future<$2.Empty> update_customer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Customer> request) async {
    return update_customer(call, await request);
  }

  $async.Future<$2.Empty> delete_customer_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_customer(call, await request);
  }

  $async.Stream<$0.Customer> get_current_customer_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async* {
    yield* get_current_customer(call, await request);
  }

  $async.Future<$1.StringValue> create_customer(
      $grpc.ServiceCall call, $0.Customer request);
  $async.Future<$0.Customer> get_customer(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$0.Customer> get_customer_by_username(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> update_customer(
      $grpc.ServiceCall call, $0.Customer request);
  $async.Future<$2.Empty> delete_customer(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$0.Customer> get_current_customer(
      $grpc.ServiceCall call, $2.Empty request);
}
