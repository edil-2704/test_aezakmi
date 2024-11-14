import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/schedule/data/models/schedule_model.dart';
import 'package:test_aezakmi/features/schedule/domain/repository/schedule_repository.dart';

@injectable
class GetSchedulesForDateUseCase {
  final ScheduleRepository repository;

  GetSchedulesForDateUseCase(this.repository);

  Future<List<ScheduleModel>> call(DateTime date) {
    return repository.getSchedulesForDate(date);
  }
}
@injectable
class AddScheduleUseCase {
  final ScheduleRepository repository;

  AddScheduleUseCase(this.repository);

  Future<void> call(ScheduleModel schedule) {
    return repository.addSchedule(schedule);
  }
}
@injectable
class UpdateScheduleUseCase {
  final ScheduleRepository repository;

  UpdateScheduleUseCase(this.repository);

  Future<void> call(ScheduleModel schedule) {
    return repository.updateSchedule(schedule);
  }
}
@injectable
class DeleteScheduleUseCase {
  final ScheduleRepository repository;

  DeleteScheduleUseCase(this.repository);

  Future<void> call(String employeeName, DateTime date) {
    return repository.deleteSchedule(employeeName, date);
  }
}
