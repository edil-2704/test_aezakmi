import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/finance/domain/finance_repository/finance_repository.dart';
import '../models/warning_model.dart';
import '../models/bonus_model.dart';
import '../models/salary_model.dart';

@Injectable(as: FinanceRepository)
class FinanceRepositoryImpl implements FinanceRepository {
  @override
  Future<List<Warning>> fetchWarnings() async {
    // Mocked data; replace this with actual API call or database interaction
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return [
      Warning(
        id: '1',
        details: 'Late submission of report',
        date: '2024-10-15',
        name: 'Fedor Ivanov',
      ),
      Warning(
        id: '2',
        details: 'Missed team meeting',
        date: '2024-11-01',
        name: 'Fedor Ivanov',
      ),
      Warning(
        id: '3',
        details: 'Missed team meeting',
        date: '2024-11-01',
        name: 'Anton Ivanov',
      ),
      Warning(
        id: '4',
        details: 'Missed team meeting',
        date: '2024-11-01',
        name: 'Andrei Ivanov',
      ),
    ];
  }

  @override
  Future<List<BonusModel>> fetchBonuses() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      BonusModel(
        id: 1,
        amount: 6000.0,
        date: DateTime.now(),
        description: 'Overslept',
      ),
      BonusModel(
        id: 2,
        amount: 3000.0,
        date: DateTime.now(),
        description: 'Lost control',
      ),
    ];
  }

  @override
  Future<List<Salary>> fetchSalaries() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Salary(id: '1', amount: '70000', date: '2024-08-30'),
      Salary(id: '2', amount: '75000', date: '2024-09-30'),
      Salary(id: '3', amount: '75000', date: '2024-10-30'),
      Salary(id: '4', amount: '75000', date: '2024-11-30'),
      Salary(id: '5', amount: '75000', date: '2024-12-30'),
    ];
  }

  @override
  Future<List<BonusModel>> getBonusesByDateAndId(
      DateTime date, int employeeId) async {
    await Future.delayed(Duration(seconds: 2));
    return [
      BonusModel(
        id: 1,
        description: 'New Lost',
        amount: 5000,
        date: date,
      ),
      BonusModel(
        id: 2,
        description: 'New Lost',
        amount: 5000,
        date: date,
      ),
      BonusModel(
        id: 3,
        description: 'New Lost',
        amount: 5000,
        date: date,
      ),
      BonusModel(
        id: 4,
        description: 'New Lost',
        amount: 5000,
        date: date,
      ),
      BonusModel(
        id: 5,
        description: 'New Lost',
        amount: 5000,
        date: date,
      ),
    ];
  }
}
