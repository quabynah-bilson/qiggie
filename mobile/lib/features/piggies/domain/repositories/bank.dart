import 'package:dartz/dartz.dart';
import 'package:mobile/protos/bank.pb.dart';

abstract class BaseBankRepository {
  Future<Either<Stream<List<QiggyBank>>, String>> getQiggies();

  Future<Either<String, String>> saveQiggyBank({
    required String name,
    required double goalAmount,
    required double initialAmount,
  });

  Future<Either<String, String>> deleteQiggyBank(String id);
}
