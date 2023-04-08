///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth.pb.dart' as $0;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $2;
export 'auth.pb.dart';

class AuthServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.Account>(
      '/savings.AuthService/login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$create_account =
      $grpc.ClientMethod<$0.CreateAccountRequest, $0.Account>(
          '/savings.AuthService/create_account',
          ($0.CreateAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$reset_password =
      $grpc.ClientMethod<$1.StringValue, $1.StringValue>(
          '/savings.AuthService/reset_password',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$send_otp = $grpc.ClientMethod<$1.StringValue, $1.StringValue>(
      '/savings.AuthService/send_otp',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$verify_otp = $grpc.ClientMethod<$1.Int32Value, $1.StringValue>(
      '/savings.AuthService/verify_otp',
      ($1.Int32Value value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$update_password =
      $grpc.ClientMethod<$1.StringValue, $1.StringValue>(
          '/savings.AuthService/update_password',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/savings.AuthService/logout',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$verify_token =
      $grpc.ClientMethod<$1.StringValue, $1.BoolValue>(
          '/savings.AuthService/verify_token',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BoolValue.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Account> login($0.LoginRequest self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, self, options: options);
  }

  $grpc.ResponseFuture<$0.Account> create_account(
      $0.CreateAccountRequest self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_account, self, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> reset_password($1.StringValue self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reset_password, self, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> send_otp($1.StringValue self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$send_otp, self, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> verify_otp($1.Int32Value self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verify_otp, self, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> update_password($1.StringValue self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_password, self, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> logout($1.StringValue self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, self, options: options);
  }

  $grpc.ResponseFuture<$1.BoolValue> verify_token($1.StringValue self,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verify_token, self, options: options);
  }
}

abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'savings.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.Account>(
        'login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateAccountRequest, $0.Account>(
        'create_account',
        create_account_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateAccountRequest.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $1.StringValue>(
        'reset_password',
        reset_password_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $1.StringValue>(
        'send_otp',
        send_otp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Int32Value, $1.StringValue>(
        'verify_otp',
        verify_otp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Int32Value.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $1.StringValue>(
        'update_password',
        update_password_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $1.BoolValue>(
        'verify_token',
        verify_token_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($1.BoolValue value) => value.writeToBuffer()));
  }

  $async.Future<$0.Account> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> self) async {
    return login(call, await self);
  }

  $async.Future<$0.Account> create_account_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateAccountRequest> self) async {
    return create_account(call, await self);
  }

  $async.Future<$1.StringValue> reset_password_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> self) async {
    return reset_password(call, await self);
  }

  $async.Future<$1.StringValue> send_otp_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> self) async {
    return send_otp(call, await self);
  }

  $async.Future<$1.StringValue> verify_otp_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Int32Value> self) async {
    return verify_otp(call, await self);
  }

  $async.Future<$1.StringValue> update_password_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> self) async {
    return update_password(call, await self);
  }

  $async.Future<$2.Empty> logout_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> self) async {
    return logout(call, await self);
  }

  $async.Future<$1.BoolValue> verify_token_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> self) async {
    return verify_token(call, await self);
  }

  $async.Future<$0.Account> login(
      $grpc.ServiceCall call, $0.LoginRequest self);
  $async.Future<$0.Account> create_account(
      $grpc.ServiceCall call, $0.CreateAccountRequest self);
  $async.Future<$1.StringValue> reset_password(
      $grpc.ServiceCall call, $1.StringValue self);
  $async.Future<$1.StringValue> send_otp(
      $grpc.ServiceCall call, $1.StringValue self);
  $async.Future<$1.StringValue> verify_otp(
      $grpc.ServiceCall call, $1.Int32Value self);
  $async.Future<$1.StringValue> update_password(
      $grpc.ServiceCall call, $1.StringValue self);
  $async.Future<$2.Empty> logout(
      $grpc.ServiceCall call, $1.StringValue self);
  $async.Future<$1.BoolValue> verify_token(
      $grpc.ServiceCall call, $1.StringValue self);
}
