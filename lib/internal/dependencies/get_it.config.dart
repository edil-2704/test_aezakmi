// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/finance/data/repository_impl/finance_repository_impl.dart'
    as _i982;
import '../../features/finance/domain/finance_repository/finance_repository.dart'
    as _i688;
import '../../features/finance/domain/finance_use_case/finance_use_case.dart'
    as _i579;
import '../../features/finance/presentation/logic/bloc/finance_bloc.dart'
    as _i420;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i688.FinanceRepository>(() => _i982.FinanceRepositoryImpl());
  gh.factory<_i579.FinanceUseCase>(
      () => _i579.FinanceUseCase(gh<_i688.FinanceRepository>()));
  gh.factory<_i420.FinanceBloc>(
      () => _i420.FinanceBloc(financeUseCase: gh<_i579.FinanceUseCase>()));
  return getIt;
}
