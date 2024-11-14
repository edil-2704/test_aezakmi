import 'package:equatable/equatable.dart';
import 'package:test_aezakmi/features/schedule/data/models/schedule_model.dart';

abstract class ScheduleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final List<ScheduleModel> schedules;

  ScheduleLoaded(this.schedules);

  @override
  List<Object?> get props => [schedules];
}

class ScheduleError extends ScheduleState {
  final String message;

  ScheduleError(this.message);

  @override
  List<Object?> get props => [message];
}
