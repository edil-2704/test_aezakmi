

class Employee {
  final String id;
  final String name;
  final String jobTitle;
  final String dateOfHire;
  final String salary;

  Employee({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.dateOfHire,
    required this.salary,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as String,
      name: json['name'] as String,
      jobTitle: json['jobTitle'] as String,
      dateOfHire: json['dateOfHire'] as String,
      salary: json['salary'] as String,
    );
  }
}
