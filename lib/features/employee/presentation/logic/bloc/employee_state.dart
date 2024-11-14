// employee_state.dart

part of 'employee_bloc.dart';

@immutable
abstract class EmployeeState {}

class EmployeeInitialState extends EmployeeState {}

class EmployeeLoadingState extends EmployeeState {}

class EmployeeLoadedState extends EmployeeState {
  final List<Employee> employees;

  EmployeeLoadedState({required this.employees});
}

class EmployeeSaved extends EmployeeState {}

class EmployeeErrorState extends EmployeeState {
  final String error;

  EmployeeErrorState({required this.error});
}
