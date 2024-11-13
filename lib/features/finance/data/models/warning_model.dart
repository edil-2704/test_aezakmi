class Warning {
  final String id;
  final String details;
  final String date;
  final String name;

  Warning({
    required this.id,
    required this.details,
    required this.date,
    required this.name,
  });

  factory Warning.fromJson(Map<String, dynamic> json) {
    return Warning(
      id: json['id'] as String,
      details: json['details'] as String,
      date: json['date'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'details': details,
        'date': date,
      };
}
