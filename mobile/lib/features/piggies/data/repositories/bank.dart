import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/piggies/domain/repositories/bank.dart';
import 'package:mobile/protos/bank.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';

@Singleton(as: BaseBankRepository)
class QiggyBankRepository extends BaseBankRepository {
  final PiggyBankServiceClient _client;

  QiggyBankRepository(this._client);

  @override
  Future<Either<String, String>> deleteQiggyBank(String id) async {
    try {
      await _client.deletePiggyBank(StringValue(value: id));
      return left('Qiggy deleted successfully');
    } on GrpcError catch (err) {
      return right(err.message ?? err.codeName);
    }
  }

  @override
  Future<Either<Stream<List<PiggyBank>>, String>> getQiggies() async {
    try {
      var banks = _client.listPiggyBanks(Empty()).map((event) => event.banks);
      return left(banks);
    } on GrpcError catch (err) {
      return right(err.message ?? err.codeName);
    }
  }

  @override
  Future<Either<String, String>> saveQiggyBank({
    required String name,
    required double goalAmount,
    required double initialAmount,
  }) async {
    try {
      var request = PiggyBank(
        // todo -> replace with user's id
        customerId: 'random01234',
        currentAmount: initialAmount,
        goalAmount: goalAmount,
        description: name,
      );
      var response = await _client.createPiggyBank(request);
      return left(response.value);
    } on GrpcError catch (err) {
      return right(err.message ?? err.codeName);
    }
  }
}
