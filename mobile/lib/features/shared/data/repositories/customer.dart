import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/customer.dart';
import 'package:mobile/protos/customer.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

// TODO -> implement methods
@Injectable(as: BaseCustomerRepository)
class QiggyCustomerRepository extends BaseCustomerRepository {
  final CustomerServiceClient _client;

  QiggyCustomerRepository(this._client);

  @override
  Future<Either<String, String>> createCustomer({
    required String displayName,
    required String username,
    required String phoneNumber,
    String? avatar,
  }) async {
    try {
      var request = Customer(
          avatar: avatar,
          displayName: displayName,
          username: username,
          phone: phoneNumber);
      var response = await _client.create_customer(request);
      return left(response.value);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<String, String>> deleteCustomer(String id) async {
    // TODO: implement deleteCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<Stream<Customer>, String>> getCurrentCustomer() async {
    try {
      var stream = _client.get_current_customer(Empty());
      return left(stream);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Customer, String>> getCustomer(String id) async {
    // TODO: implement getCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> updateCustomer(Customer customer) async {
    // TODO: implement updateCustomer
    throw UnimplementedError();
  }
}
