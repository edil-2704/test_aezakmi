import 'package:test_aezakmi/features/schedule/data/models/schedule_model.dart';

abstract class ScheduleState {}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final List<ScheduleModel> schedules;
  ScheduleLoaded(this.schedules);
}

class ScheduleError extends ScheduleState {
  final String message;
  ScheduleError(this.message);
}
