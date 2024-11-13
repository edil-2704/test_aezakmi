part of 'finance_bloc.dart';

@immutable
abstract class FinanceEvent {}

class FetchWarnings extends FinanceEvent {}

class FetchBonuses extends FinanceEvent {}

class FetchSalaries extends FinanceEvent {}
