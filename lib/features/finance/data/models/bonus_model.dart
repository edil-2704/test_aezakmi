class BonusModel {
  final int id;
  final String description;
  final double amount;
  final DateTime date;

  BonusModel({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
  });

  // Factory constructor to create a Bonus from JSON
  factory BonusModel.fromJson(Map<String, dynamic> json) {
    return BonusModel(
      id: json['id'],
      description: json['description'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
    );
  }

  // Convert Bonus to JSON if needed for local storage or other purposes
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }
}
