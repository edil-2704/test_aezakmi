import 'package:test_aezakmi/features/schedule/data/models/schedule_model.dart';

abstract class ScheduleRepository {
  Future<List<ScheduleModel>> getSchedules(DateTime date);
  Future<void> addSchedule(ScheduleModel schedule);
  Future<void> updateSchedule(ScheduleModel schedule);
  Future<void> deleteSchedule(String scheduleId);
}
