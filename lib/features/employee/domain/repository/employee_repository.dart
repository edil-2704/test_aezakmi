// employee_repository.dart

import 'package:test_aezakmi/features/employee/data/model/employee_model.dart';

abstract class EmployeeRepository {
  Future<List<Employee>> getEmployees();
  Future<void> addEmployee(Employee employee);

  Future<void> saveEmployee({
    required String name,
    required String jobTitle,
    required String salary,
    required String phone,
    required String date,
    required String comments,
  });
}

abstract class EmployeeSaveRepository {
  
}