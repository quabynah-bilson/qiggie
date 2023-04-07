import 'package:grpc/grpc.dart';
import 'package:shared_utils/shared_utils.dart';

class LogGrpcInterceptor implements ClientInterceptor {
  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker) {
    var newOpts = options.mergedWith(
      CallOptions(
        metadata: {
          // TODO: add authorization token
          'Authorization': 'Bearer <PUT-TOKEN-HERE>'
        },
      ),
    );

    logger.d(
        'grpc streaming method: ${method.path} => metadata: ${newOpts.metadata}');
    // do nothing for now
    return invoker(method, requests, newOpts);
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request,
      CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    var newOpts = options.mergedWith(
      CallOptions(
        metadata: {
          // TODO: add authorization token
          'Authorization': 'Bearer <PUT-TOKEN-HERE>'
        },
      ),
    );
    logger.d(
        'grpc unary method: ${method.path} => metadata: ${newOpts.metadata} => payload : $request');
    return invoker(method, request, newOpts)
      ..then((data) => logger.d('grpc unary response => $data'));
  }
}
