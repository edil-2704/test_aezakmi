// employee_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:meta/meta.dart';
import 'package:test_aezakmi/features/workers/data/model/employee_model.dart';
import 'package:test_aezakmi/features/workers/domain/repository/employee_repository.dart';

part 'employee_event.dart';
part 'employee_state.dart';

@injectable
class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository repository;

  EmployeeBloc({required this.repository}) : super(EmployeeInitialState()) {
    on<FetchEmployees>((event, emit) async {
      emit(EmployeeLoadingState());
      try {
        final employees = await repository.getEmployees();
        emit(EmployeeLoadedState(employees: employees));
      } catch (error) {
        emit(EmployeeErrorState(error: error.toString()));
      }
    });

    on<AddEmployee>((event, emit) async {
      emit(EmployeeLoadingState());
      try {
        await repository.addEmployee(event.employee);
        add(FetchEmployees()); // Refresh employee list
      } catch (error) {
        emit(EmployeeErrorState(error: error.toString()));
      }
    });

    on<SaveEmployeeEvent>((event, emit) async {
      emit(EmployeeLoadingState());

      try {
        await (repository.addEmployee(event.employee));

        emit(EmployeeSaved());
      } catch (e) {
        emit(EmployeeErrorState(error: 'Failed to save employee'));
      }
    });
  }
}
