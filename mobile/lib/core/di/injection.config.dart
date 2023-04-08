// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile/core/network/config.dart' as _i12;
import 'package:mobile/features/piggies/data/repositories/bank.dart' as _i9;
import 'package:mobile/features/piggies/domain/repositories/bank.dart' as _i8;
import 'package:mobile/features/shared/data/repositories/auth.dart' as _i4;
import 'package:mobile/features/shared/data/repositories/customer.dart' as _i11;
import 'package:mobile/features/shared/domain/repositories/auth.dart' as _i3;
import 'package:mobile/features/shared/domain/repositories/customer.dart'
    as _i10;
import 'package:mobile/protos/bank.pbgrpc.dart' as _i6;
import 'package:mobile/protos/customer.pbgrpc.dart' as _i5;
import 'package:mobile/protos/savings.pbgrpc.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkConfigModule = _$NetworkConfigModule();
    gh.factory<_i3.BaseAuthRepository>(() => _i4.QiggyAuthRepository());
    gh.factory<_i5.CustomerServiceClient>(
        () => networkConfigModule.customerServiceClient);
    gh.factory<_i6.QiggyBankServiceClient>(
        () => networkConfigModule.bankServiceClient);
    gh.factory<_i7.SavingsServiceClient>(
        () => networkConfigModule.savingsServiceClient);
    gh.singleton<_i8.BaseBankRepository>(
        _i9.QiggyBankRepository(gh<_i6.QiggyBankServiceClient>()));
    gh.factory<_i10.BaseCustomerRepository>(
        () => _i11.QiggyCustomerRepository(gh<_i5.CustomerServiceClient>()));
    return this;
  }
}

class _$NetworkConfigModule extends _i12.NetworkConfigModule {}
