// employee_repository_impl.dart

import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/employee/data/model/employee_model.dart';
import 'package:test_aezakmi/features/employee/domain/repository/employee_repository.dart';

@Injectable(as: EmployeeRepository)
class EmployeeRepositoryImpl implements EmployeeRepository {
  @override
  Future<List<Employee>> getEmployees() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Employee(
        id: '1',
        name: 'Кудрявцев Владимир Андреевич',
        jobTitle: 'ИТ-аналитик',
        dateOfHire: '20 января 2024',
        salary: '100 000 ₽',
      ),
      Employee(
        id: '2',
        name: 'Кудрявцев Владимир Андреевич',
        jobTitle: 'ИТ-аналитик',
        dateOfHire: '20 января 2024',
        salary: '100 000 ₽',
      ),
      Employee(
        id: '3',
        name: 'Кудрявцев Anton Андреевич',
        jobTitle: 'ИТ-аналитик',
        dateOfHire: '20 января 2024',
        salary: '100 000 ₽',
      ),
      Employee(
        id: '4',
        name: 'Кудрявцев Владимир Андреевич',
        jobTitle: 'ИТ-аналитик',
        dateOfHire: '20 января 2024',
        salary: '100 000 ₽',
      ),
    ];
  }

  @override
  Future<void> addEmployee(Employee employee) async {
    // Code to save employee, could be to a database or API
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> saveEmployee({
    required String name,
    required String jobTitle,
    required String salary,
    required String phone,
    required String date,
    required String comments,
  }) async {
    // Simulate saving data, e.g., in a local database
    await Future.delayed(Duration(seconds: 1));
    print(
        "Employee saved: $name, $jobTitle, $salary, $phone, $date, $comments");
  }
}
