import 'package:equatable/equatable.dart';
import 'package:test_aezakmi/features/graphs/models/schedule_model_one.dart';

// ignore: must_be_immutable
class ScheduleModel extends Equatable {
  ScheduleModel({this.scheduleOneItemList = const []});
  List<ScheduleOneItemModel> scheduleOneItemList;
  ScheduleModel copyWith({List<ScheduleOneItemModel>? scheduleOneItemList}) {
    return ScheduleModel(
      scheduleOneItemList: scheduleOneItemList ?? this.scheduleOneItemList,
    );
  }

  @override
  List<Object?> get props => [scheduleOneItemList];
}
