part of 'finance_bloc.dart';

@immutable
abstract class FinanceEvent {}

class FetchWarnings extends FinanceEvent {}

class FetchBonuses extends FinanceEvent {}

class FetchSalaries extends FinanceEvent {}

class FetchBonusesByDateAndId extends FinanceEvent {
  final DateTime date;
  final int employeeId;

  FetchBonusesByDateAndId({required this.date, required this.employeeId});

  get id => null;
}

