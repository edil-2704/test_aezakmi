part of 'finance_bloc.dart';

@immutable
abstract class FinanceState {}

class FinanceInitialState extends FinanceState {}

class FinanceLoadingState extends FinanceState {}

class FinanceEpmtyState extends FinanceState {}

class FinanceLoadedWarningsState extends FinanceState {
  final List<Warning> warnings;

  FinanceLoadedWarningsState({required this.warnings});
}

class FinanceLoadedBonusesState extends FinanceState {
  final List<Bonus> bonuses;

  FinanceLoadedBonusesState({required this.bonuses});
}

class FinanceLoadedSalariesState extends FinanceState {
  final List<Salary> salaries;

  FinanceLoadedSalariesState({required this.salaries});
}

class FinanceErrorState extends FinanceState {
  final String error;

  FinanceErrorState({required this.error});
}
