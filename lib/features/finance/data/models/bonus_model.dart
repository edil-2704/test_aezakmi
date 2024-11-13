class Bonus {
  final String id;
  final String amount;
  final String date;

  Bonus({
    required this.id,
    required this.amount,
    required this.date,
  });

  factory Bonus.fromJson(Map<String, dynamic> json) {
    return Bonus(
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
