import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String date;
  final String salary;

  const EmployeeCard(
      {required this.name,
      required this.jobTitle,
      required this.date,
      required this.salary,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, color: Color(0xFF2253F6)),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.circle, size: 4, color: Color(0xFF818181)),
                const SizedBox(width: 8),
                Text(
                  jobTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF818181),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.circle, size: 4, color: Color(0xFF818181)),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF818181),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.circle, size: 4, color: Color(0xFF818181)),
                const SizedBox(width: 8),
                Text(
                  salary,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF818181),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}