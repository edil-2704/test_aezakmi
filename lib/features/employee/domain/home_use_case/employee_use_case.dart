// employee_use_case_impl.dart

import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/employee/data/model/employee_model.dart';
import 'package:test_aezakmi/features/employee/domain/repository/employee_repository.dart';


@injectable
class EmployeeUseCaseImpl implements EmployeeUseCase {
  final EmployeeRepository employeeRepository;

  EmployeeUseCaseImpl({required this.employeeRepository});

  Future<List<Employee>> fetchEmployees() async {
    return await employeeRepository.getEmployees();
  }

  Future<void> addNewEmployee(Employee employee) async {
    await employeeRepository.addEmployee(employee);
  }
}

abstract class EmployeeUseCase {
  Future<List<Employee>> fetchEmployees();
  Future<void> addNewEmployee(Employee employee);
}


abstract class SaveEmployeeUseCase {
  Future<void> execute(Employee employee);
}

@injectable
class SaveEmployeeUseCaseImpl implements SaveEmployeeUseCase {
  final EmployeeRepository employeeRepository;

  SaveEmployeeUseCaseImpl({required this.employeeRepository});

  @override
  Future<void> execute(Employee employee) async {
    await employeeRepository.addEmployee(employee);
  }
}