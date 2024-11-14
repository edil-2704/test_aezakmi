import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_aezakmi/features/schedule/domain/use_case/schedule_use_case.dart';
import 'package:test_aezakmi/features/schedule/presentation/logic/bloc/schedule_event.dart';
import 'package:test_aezakmi/features/schedule/presentation/logic/bloc/schedule_state.dart';


@injectable
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final GetSchedulesForDateUseCase getSchedulesForDateUseCase;
  final AddScheduleUseCase addScheduleUseCase;
  final UpdateScheduleUseCase updateScheduleUseCase;
  final DeleteScheduleUseCase deleteScheduleUseCase;

  ScheduleBloc({
    required this.getSchedulesForDateUseCase,
    required this.addScheduleUseCase,
    required this.updateScheduleUseCase,
    required this.deleteScheduleUseCase,
  }) : super(ScheduleInitial()) {
    on<LoadSchedules>((event, emit) async {
      emit(ScheduleLoading());
      try {
        final schedules = await getSchedulesForDateUseCase(event.date);
        emit(ScheduleLoaded(schedules));
      } catch (e) {
        emit(ScheduleError('Failed to load schedules'));
      }
    });

    on<AddSchedule>((event, emit) async {
      try {
        await addScheduleUseCase(event.schedule);
        add(LoadSchedules(DateTime.now()));
      } catch (e) {
        emit(ScheduleError('Failed to add schedule'));
      }
    });

    on<UpdateSchedule>((event, emit) async {
      try {
        await updateScheduleUseCase(event.schedule);
        add(LoadSchedules(DateTime.now()));
      } catch (e) {
        emit(ScheduleError('Failed to update schedule'));
      }
    });

    on<DeleteSchedule>((event, emit) async {
      try {
        await deleteScheduleUseCase(event.employeeName, event.date);
        add(LoadSchedules(DateTime.now()));
      } catch (e) {
        emit(ScheduleError('Failed to delete schedule'));
      }
    });
  }
}
