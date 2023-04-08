import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/customer.dart';
import 'package:mobile/protos/customer.pbgrpc.dart';

@Injectable(as: BaseCustomerRepository)
class QiggyCustomerRepository extends BaseCustomerRepository {
  final CustomerServiceClient _client;

  QiggyCustomerRepository(this._client);

  @override
  Future<Either<String, String>> createCustomer() async {
    // TODO: implement createCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> deleteCustomer(String id) async {
    // TODO: implement deleteCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<Stream<Customer>, String>> getCurrentCustomer() async {
    // TODO: implement getCurrentCustomer
    throw UnimplementedError();
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
