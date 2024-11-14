// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/employee/data/home_repository_impl/employee_repository_impl.dart'
    as _i245;
import '../../features/employee/domain/home_use_case/employee_use_case.dart'
    as _i125;
import '../../features/employee/domain/repository/employee_repository.dart'
    as _i562;
import '../../features/employee/presentation/logic/bloc/employee_bloc.dart'
    as _i625;
import '../../features/finance/data/repository_impl/finance_repository_impl.dart'
    as _i982;
import '../../features/finance/domain/finance_repository/finance_repository.dart'
    as _i688;
import '../../features/finance/domain/finance_use_case/finance_use_case.dart'
    as _i579;
import '../../features/finance/presentation/logic/bloc/finance_bloc.dart'
    as _i420;
import '../../features/schedule/data/graph_repository_impl/schedule_repository_impl.dart'
    as _i389;
import '../../features/schedule/data/models/schedule_model.dart' as _i937;
import '../../features/schedule/domain/repository/schedule_repository.dart'
    as _i853;
import '../../features/schedule/domain/use_case/schedule_use_case.dart'
    as _i522;
import '../../features/schedule/presentation/logic/bloc/schedule_bloc.dart'
    as _i989;

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
  gh.factory<_i562.EmployeeRepository>(() => _i245.EmployeeRepositoryImpl());
  gh.factory<_i688.FinanceRepository>(() => _i982.FinanceRepositoryImpl());
  gh.factory<_i125.EmployeeUseCaseImpl>(() => _i125.EmployeeUseCaseImpl(
      employeeRepository: gh<_i562.EmployeeRepository>()));
  gh.factory<_i125.SaveEmployeeUseCaseImpl>(() => _i125.SaveEmployeeUseCaseImpl(
      employeeRepository: gh<_i562.EmployeeRepository>()));
  gh.factory<_i853.ScheduleRepository>(
      () => _i389.ScheduleRepositoryImpl(gh<_i979.Box<_i937.ScheduleModel>>()));
  gh.factory<_i579.FinanceUseCase>(
      () => _i579.FinanceUseCase(gh<_i688.FinanceRepository>()));
  gh.factory<_i579.GetBonusesByDateAndId>(
      () => _i579.GetBonusesByDateAndId(gh<_i688.FinanceRepository>()));
  gh.factory<_i625.EmployeeBloc>(
      () => _i625.EmployeeBloc(repository: gh<_i562.EmployeeRepository>()));
  gh.factory<_i522.GetSchedulesForDateUseCase>(
      () => _i522.GetSchedulesForDateUseCase(gh<_i853.ScheduleRepository>()));
  gh.factory<_i522.AddScheduleUseCase>(
      () => _i522.AddScheduleUseCase(gh<_i853.ScheduleRepository>()));
  gh.factory<_i522.UpdateScheduleUseCase>(
      () => _i522.UpdateScheduleUseCase(gh<_i853.ScheduleRepository>()));
  gh.factory<_i522.DeleteScheduleUseCase>(
      () => _i522.DeleteScheduleUseCase(gh<_i853.ScheduleRepository>()));
  gh.factory<_i420.FinanceBloc>(() => _i420.FinanceBloc(
        financeUseCase: gh<_i579.FinanceUseCase>(),
        getBonusesByDateAndId: gh<_i579.GetBonusesByDateAndId>(),
      ));
  gh.factory<_i989.ScheduleBloc>(() => _i989.ScheduleBloc(
        getSchedulesForDateUseCase: gh<_i522.GetSchedulesForDateUseCase>(),
        addScheduleUseCase: gh<_i522.AddScheduleUseCase>(),
        updateScheduleUseCase: gh<_i522.UpdateScheduleUseCase>(),
        deleteScheduleUseCase: gh<_i522.DeleteScheduleUseCase>(),
      ));
  return getIt;
}
