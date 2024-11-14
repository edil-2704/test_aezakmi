import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/schedule/data/models/schedule_model.dart';
import 'package:test_aezakmi/features/schedule/domain/repository/schedule_repository.dart';

@Injectable(as: ScheduleRepository)
class ScheduleRepositoryImpl implements ScheduleRepository {
  Future<Box<ScheduleModel>> _getScheduleBox() async {
    return await Hive.openBox<ScheduleModel>('schedules');
  }

  @override
  Future<List<ScheduleModel>> getSchedules(DateTime date) async {
    final scheduleBox = await _getScheduleBox();
    return scheduleBox.values
        .where((schedule) => _isSameDate(schedule.startTime as DateTime, date))
        .toList();
  }

  @override
  Future<void> addSchedule(ScheduleModel schedule) async {
    final scheduleBox = await _getScheduleBox();
    await scheduleBox.put(schedule.employeeName, schedule);
  }

  @override
  Future<void> updateSchedule(ScheduleModel schedule) async {
    final scheduleBox = await _getScheduleBox();
    await scheduleBox.put(schedule.employeeName, schedule);
  }

  @override
  Future<void> deleteSchedule(String scheduleId) async {
    final scheduleBox = await _getScheduleBox();
    await scheduleBox.delete(scheduleId);
  }

  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
