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
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.AuthResponse>(
      '/auth.AuthService/login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));
  static final _$create_account =
      $grpc.ClientMethod<$0.CreateAccountRequest, $0.AuthResponse>(
          '/auth.AuthService/create_account',
          ($0.CreateAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));
  static final _$reset_password =
      $grpc.ClientMethod<$1.StringValue, $1.StringValue>(
          '/auth.AuthService/reset_password',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$send_otp = $grpc.ClientMethod<$1.StringValue, $1.StringValue>(
      '/auth.AuthService/send_otp',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$verify_otp = $grpc.ClientMethod<$1.Int32Value, $1.StringValue>(
      '/auth.AuthService/verify_otp',
      ($1.Int32Value value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$update_password =
      $grpc.ClientMethod<$1.StringValue, $1.StringValue>(
          '/auth.AuthService/update_password',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/auth.AuthService/logout',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$refresh_token = $grpc.ClientMethod<$1.StringValue, $0.Session>(
      '/auth.AuthService/refresh_token',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Session.fromBuffer(value));
  static final _$verify_token =
      $grpc.ClientMethod<$1.StringValue, $1.BoolValue>(
          '/auth.AuthService/verify_token',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BoolValue.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AuthResponse> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthResponse> create_account(
      $0.CreateAccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_account, request, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> reset_password($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reset_password, request, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> send_otp($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$send_otp, request, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> verify_otp($1.Int32Value request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verify_otp, request, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> update_password($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_password, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> logout($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$0.Session> refresh_token($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refresh_token, request, options: options);
  }

  $grpc.ResponseFuture<$1.BoolValue> verify_token($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verify_token, request, options: options);
  }
}

abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.AuthResponse>(
        'login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateAccountRequest, $0.AuthResponse>(
        'create_account',
        create_account_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateAccountRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.Session>(
        'refresh_token',
        refresh_token_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.Session value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $1.BoolValue>(
        'verify_token',
        verify_token_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($1.BoolValue value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.AuthResponse> create_account_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateAccountRequest> request) async {
    return create_account(call, await request);
  }

  $async.Future<$1.StringValue> reset_password_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return reset_password(call, await request);
  }

  $async.Future<$1.StringValue> send_otp_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return send_otp(call, await request);
  }

  $async.Future<$1.StringValue> verify_otp_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Int32Value> request) async {
    return verify_otp(call, await request);
  }

  $async.Future<$1.StringValue> update_password_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return update_password(call, await request);
  }

  $async.Future<$2.Empty> logout_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return logout(call, await request);
  }

  $async.Future<$0.Session> refresh_token_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return refresh_token(call, await request);
  }

  $async.Future<$1.BoolValue> verify_token_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return verify_token(call, await request);
  }

  $async.Future<$0.AuthResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.AuthResponse> create_account(
      $grpc.ServiceCall call, $0.CreateAccountRequest request);
  $async.Future<$1.StringValue> reset_password(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$1.StringValue> send_otp(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$1.StringValue> verify_otp(
      $grpc.ServiceCall call, $1.Int32Value request);
  $async.Future<$1.StringValue> update_password(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> logout(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$0.Session> refresh_token(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$1.BoolValue> verify_token(
      $grpc.ServiceCall call, $1.StringValue request);
}
