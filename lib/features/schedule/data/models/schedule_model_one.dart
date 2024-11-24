import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ScheduleOneItemModel extends Equatable {
  ScheduleOneItemModel({this.name, this.time, this.id}) {
   
  }

  String? name;
  String? time;
  String? id;

  ScheduleOneItemModel copyWith({
    String? name,
    String? time,
    String? id,
  }) {
    return ScheduleOneItemModel(
      name: name ?? this.name,
      time: time ?? this.time,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [name, time, id];
}
