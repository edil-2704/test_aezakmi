

import 'package:flutter/material.dart';

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


@immutable
abstract class EmployeeEvent {}

class SaveEmployee extends EmployeeEvent {
  final String name;
  final String jobTitle;
  final String salary;
  final String phone;
  final String date;
  final String comments;

  SaveEmployee({
    required this.name,
    required this.jobTitle,
    required this.salary,
    required this.phone,
    required this.date,
    required this.comments,
  });
}