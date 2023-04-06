import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/network/log.interceptor.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/protos/bank.pbgrpc.dart';
import 'package:mobile/protos/customer.pbgrpc.dart';
import 'package:mobile/protos/savings.pbgrpc.dart';

/// module for grpc client configuration
@module
abstract class NetworkConfigModule {
  ClientInterceptor get _logInterceptor => LogGrpcInterceptor();
  ClientChannel _createChannel(int port, [String host = '192.168.0.170']) =>
      ClientChannel(
        host,
        port: port,
        options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(), userAgent: kAppName),
      );

  @injectable
  CustomerServiceClient get customerServiceClient =>
      CustomerServiceClient(_createChannel(1149), interceptors: [_logInterceptor]);

  @injectable
  PiggyBankServiceClient get bankServiceClient =>
      PiggyBankServiceClient(_createChannel(1150), interceptors: [_logInterceptor]);

  @injectable
  SavingsServiceClient get savingsServiceClient =>
      SavingsServiceClient(_createChannel(1151), interceptors: []);
}
