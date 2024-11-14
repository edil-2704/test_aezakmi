class ScheduleModel {
  final String employeeName;
  final String startTime;
  final String endTime;
  final bool isHoliday;

  ScheduleModel({
    required this.employeeName,
    required this.startTime,
    required this.endTime,
    this.isHoliday = false, required id,
  });

  get id => null;

  // Add methods for serialization if needed, e.g., toMap and fromMap for local storage or API usage.
}
