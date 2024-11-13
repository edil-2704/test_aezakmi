import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:test_aezakmi/features/finance/data/models/bonus_model.dart';
import 'package:test_aezakmi/features/finance/data/models/salary_model.dart';
import 'package:test_aezakmi/features/finance/data/models/warning_model.dart';
import 'package:test_aezakmi/features/finance/domain/finance_use_case/finance_use_case.dart';
import 'package:test_aezakmi/internal/helpers/catch_exception/catch_exception.dart';

part 'finance_event.dart';
part 'finance_state.dart';

@injectable
class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  final FinanceUseCase financeUseCase;

  FinanceBloc({required this.financeUseCase}) : super(FinanceInitialState()) {
    on<FetchWarnings>(_onFetchWarnings);
    on<FetchBonuses>(_onFetchBonuses);
    on<FetchSalaries>(_onFetchSalaries);
  }

  Future<void> _onFetchWarnings(
      FetchWarnings event, Emitter<FinanceState> emit) async {
    emit(FinanceLoadingState());
    try {
      final warnings = await financeUseCase.getWarnings();
      emit(FinanceLoadedWarningsState(warnings: warnings));
    } catch (e) {
      emit(FinanceErrorState(
          error: CatchException.convertException(e).toString()));
    }
  }

  Future<void> _onFetchBonuses(
      FetchBonuses event, Emitter<FinanceState> emit) async {
    emit(FinanceLoadingState());
    try {
      final bonuses = await financeUseCase.getBonuses();
      emit(FinanceLoadedBonusesState(bonuses: bonuses));
    } catch (e) {
      emit(FinanceErrorState(
          error: CatchException.convertException(e).toString()));
    }
  }

  Future<void> _onFetchSalaries(
      FetchSalaries event, Emitter<FinanceState> emit) async {
    emit(FinanceLoadingState());
    try {
      final salaries = await financeUseCase.getSalaries();
      emit(FinanceLoadedSalariesState(salaries: salaries));
    } catch (e) {
      emit(FinanceErrorState(
          error: CatchException.convertException(e).toString()));
    }
  }
}
