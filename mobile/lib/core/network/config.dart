import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/network/log.interceptor.dart';
import 'package:mobile/core/network/token.interceptor.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:mobile/protos/bank.pbgrpc.dart';
import 'package:mobile/protos/customer.pbgrpc.dart';
import 'package:mobile/protos/savings.pbgrpc.dart';

/// module for grpc client configuration
@module
abstract class NetworkConfigModule {
  ClientInterceptor get _logInterceptor => LogGrpcInterceptor();

  ClientInterceptor get _tokenInterceptor => TokenGrpcInterceptor();

  ClientChannel _createChannel(int port, [String host = '192.168.0.170']) =>
      ClientChannel(
        host,
        port: port,
        options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(), userAgent: kAppName),
      );

  @injectable
  AuthServiceClient get authServiceClient =>
      AuthServiceClient(_createChannel(1140),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  CustomerServiceClient get customerServiceClient =>
      CustomerServiceClient(_createChannel(1149),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  QiggyBankServiceClient get bankServiceClient =>
      QiggyBankServiceClient(_createChannel(1150),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  SavingsServiceClient get savingsServiceClient =>
      SavingsServiceClient(_createChannel(1148),
          interceptors: [_tokenInterceptor, _logInterceptor]);
}
