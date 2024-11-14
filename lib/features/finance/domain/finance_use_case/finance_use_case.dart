import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/finance/data/models/bonus_model.dart';
import 'package:test_aezakmi/features/finance/data/models/salary_model.dart';
import 'package:test_aezakmi/features/finance/data/models/warning_model.dart';
import 'package:test_aezakmi/features/finance/domain/finance_repository/finance_repository.dart';

@injectable

class FinanceUseCase {
  final FinanceRepository repository;

  FinanceUseCase(this.repository);

  Future<List<Warning>> getWarnings() {
    return repository.fetchWarnings();
  }

  Future<List<BonusModel>> getBonuses() {
    return repository.fetchBonuses();
  }

  Future<List<Salary>> getSalaries() {
    return repository.fetchSalaries();
  }

  
}

@injectable
class GetBonusesByDateAndId {
  final FinanceRepository repository;

  GetBonusesByDateAndId(this.repository);

  Future<List<BonusModel>> call(DateTime date, int employeeId) async {
    return await repository.getBonusesByDateAndId(date, employeeId);
  }
}
