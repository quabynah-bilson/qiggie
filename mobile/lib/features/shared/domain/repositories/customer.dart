import 'package:dartz/dartz.dart';
import 'package:mobile/protos/customer.pb.dart';

abstract class BaseCustomerRepository {
  Future<Either<String, String>> createCustomer({
    required String displayName,
    required String username,
    required String phoneNumber,
    String? avatar,
  });

  Future<Either<Customer, String>> getCustomer(String id);

  Future<Either<String, String>> updateCustomer(Customer customer);

  Future<Either<String, String>> deleteCustomer(String id);

  Future<Either<Stream<Customer>, String>> getCurrentCustomer();
}
