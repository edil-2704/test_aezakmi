import 'package:test_aezakmi/features/finance/data/models/bonus_model.dart';
import 'package:test_aezakmi/features/finance/data/models/salary_model.dart';
import 'package:test_aezakmi/features/finance/data/models/warning_model.dart';

abstract class FinanceRepository {
  Future<List<Warning>> fetchWarnings();
  Future<List<BonusModel>> fetchBonuses();
  Future<List<Salary>> fetchSalaries();
  Future<List<BonusModel>> getBonusesByDateAndId(DateTime date, int employeeId);
}
