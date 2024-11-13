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
    ];
  }

  @override
  Future<List<Bonus>> fetchBonuses() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Bonus(id: '1', amount: '5000', date: '2024-10-10'),
      Bonus(id: '2', amount: '3000', date: '2024-11-01'),
    ];
  }

  @override
  Future<List<Salary>> fetchSalaries() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Salary(id: '1', amount: '70000', date: '2024-10-30'),
      Salary(id: '2', amount: '75000', date: '2024-11-30'),
    ];
  }
}
