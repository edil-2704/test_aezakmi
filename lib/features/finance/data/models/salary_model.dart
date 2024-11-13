class Salary {
  final String id;
  final String amount;
  final String date;

  Salary({
    required this.id,
    required this.amount,
    required this.date,
  });

  factory Salary.fromJson(Map<String, dynamic> json) {
    return Salary(
      id: json['id'] as String,
      amount: json['amount'] as String,
      date: json['date'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'date': date,
      };
}
