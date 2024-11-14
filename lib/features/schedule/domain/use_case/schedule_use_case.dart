import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/schedule/data/models/schedule_model.dart';
import 'package:test_aezakmi/features/schedule/domain/repository/schedule_repository.dart';
@injectable
class GetSchedules {
  final ScheduleRepository repository;

  GetSchedules(this.repository);

  Future<List<ScheduleModel>> call(DateTime date) {
    return repository.getSchedules(date);
  }
}
@injectable
class AddSchedule {
  final ScheduleRepository repository;

  AddSchedule(this.repository);

  Future<void> call(ScheduleModel schedule) {
    return repository.addSchedule(schedule);
  }
}
@injectable
class UpdateSchedule {
  final ScheduleRepository repository;

  UpdateSchedule(this.repository);

  Future<void> call(ScheduleModel schedule) {
    return repository.updateSchedule(schedule);
  }
}
@injectable
class DeleteSchedule {
  final ScheduleRepository repository;

  DeleteSchedule(this.repository);

  Future<void> call(String scheduleId) {
    return repository.deleteSchedule(scheduleId);
  }
}
