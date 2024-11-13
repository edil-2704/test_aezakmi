// employee_event.dart

part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent {}

class FetchEmployees extends EmployeeEvent {}

class AddEmployee extends EmployeeEvent {
  final Employee employee;

  AddEmployee(this.employee);
}
