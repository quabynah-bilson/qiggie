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
import 'package:mobile/core/network/config.dart' as _i6;
import 'package:mobile/protos/bank.pbgrpc.dart' as _i4;
import 'package:mobile/protos/customer.pbgrpc.dart' as _i3;
import 'package:mobile/protos/savings.pbgrpc.dart' as _i5;

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
    gh.factory<_i3.CustomerServiceClient>(
        () => networkConfigModule.customerServiceClient);
    gh.factory<_i4.PiggyBankServiceClient>(
        () => networkConfigModule.bankServiceClient);
    gh.factory<_i5.SavingsServiceClient>(
        () => networkConfigModule.savingsServiceClient);
    return this;
  }
}

class _$NetworkConfigModule extends _i6.NetworkConfigModule {}
