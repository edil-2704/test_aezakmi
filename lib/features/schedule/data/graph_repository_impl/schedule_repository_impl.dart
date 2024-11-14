import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/schedule/data/models/schedule_model.dart';
import 'package:test_aezakmi/features/schedule/domain/repository/schedule_repository.dart';

@Injectable(as: ScheduleRepository)

class ScheduleRepositoryImpl implements ScheduleRepository {
  final Box<ScheduleModel> scheduleBox;

  ScheduleRepositoryImpl(this.scheduleBox);

  @override
  Future<List<ScheduleModel>> getSchedulesForDate(DateTime date) async {
    return scheduleBox.values
        .where((schedule) =>
            schedule.startTime.contains(date.toString().substring(0, 10)))
        .toList();
  }

  @override
  Future<void> addSchedule(ScheduleModel schedule) async {
    await scheduleBox.put(schedule.employeeName, schedule);
  }

  @override
  Future<void> updateSchedule(ScheduleModel schedule) async {
    await scheduleBox.put(schedule.employeeName, schedule);
  }

  @override
  Future<void> deleteSchedule(String employeeName, DateTime date) async {
    await scheduleBox.delete(employeeName);
  }
}
