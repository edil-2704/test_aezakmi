import 'package:test_aezakmi/features/schedule/data/models/schedule_model.dart';

abstract class ScheduleEvent {}

class LoadSchedules extends ScheduleEvent {
  final DateTime date;
  LoadSchedules(this.date);
}

class AddSchedule extends ScheduleEvent {
  final ScheduleModel schedule;
  AddSchedule(this.schedule);
}

class UpdateSchedule extends ScheduleEvent {
  final ScheduleModel schedule;
  UpdateSchedule(this.schedule);
}

class DeleteSchedule extends ScheduleEvent {
  final String employeeName;
  final DateTime date;
  DeleteSchedule(this.employeeName, this.date);
}
