import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/schedule/data/graph_repository_impl/schedule_repository_impl.dart';
import 'package:test_aezakmi/features/schedule/data/models/schedule_model.dart';
import 'package:test_aezakmi/features/schedule/domain/repository/schedule_repository.dart';
import 'package:test_aezakmi/features/schedule/domain/use_case/schedule_use_case.dart';
import 'package:test_aezakmi/features/schedule/presentation/logic/bloc/schedule_bloc.dart';
import 'package:test_aezakmi/internal/dependencies/get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
  usesNullSafety: true,
)
void configureDependencies() => $initGetIt(getIt);

final locator = GetIt.instance;
