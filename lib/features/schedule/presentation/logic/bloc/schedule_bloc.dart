// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:test_aezakmi/features/schedule/domain/use_case/schedule_use_case.dart';
// import 'schedule_state.dart';

// @injectable
// class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
//   final GetSchedules getSchedules;
//   final AddSchedule addSchedule;
//   final UpdateSchedule updateSchedule;
//   final DeleteSchedule deleteSchedule;

//   ScheduleBloc({
//     required this.getSchedules,
//     required this.addSchedule,
//     required this.updateSchedule,
//     required this.deleteSchedule,
//   }) : super(ScheduleLoading()) {
//     on<LoadSchedules>((event, emit) async {
//       emit(ScheduleLoading());
//       try {
//         final schedules = await getSchedules(event.date);
//         emit(ScheduleLoaded(schedules));
//       } catch (e) {
//         emit(ScheduleError(e.toString()));
//       }
//     });

//     on<AddScheduleEvent>((event, emit) async {
//       try {
//         await addSchedule(event.schedule);
//         add(LoadSchedules(DateTime.now())); // Reload after adding
//       } catch (e) {
//         emit(ScheduleError(e.toString()));
//       }
//     });

//     on<UpdateScheduleEvent>((event, emit) async {
//       try {
//         await updateSchedule(event.schedule);
//         add(LoadSchedules(DateTime.now())); // Reload after updating
//       } catch (e) {
//         emit(ScheduleError(e.toString()));
//       }
//     });

//     on<DeleteScheduleEvent>((event, emit) async {
//       try {
//         await deleteSchedule(event.scheduleId);
//         add(LoadSchedules(DateTime.now())); // Reload after deleting
//       } catch (e) {
//         emit(ScheduleError(e.toString()));
//       }
//     });
//   }
// }
