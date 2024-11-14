
part of 'episodes_bloc.dart';

sealed class ScheduleEvent {}

class GetAllSchedule extends ScheduleEvent {
  final int page;
  

  GetAllSchedule({
    required this.page,

  });
}

class GetAllSchedulesById extends ScheduleEvent {
  final int id;

  GetAllSchedulesById({required this.id});
}
