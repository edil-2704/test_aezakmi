import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_aezakmi/features/finance/data/models/salary_model.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/salary_info_page.dart';

class BuildSalaryCard extends StatelessWidget {
  final Salary salaries;
  const BuildSalaryCard({
    super.key,
    required this.salaries,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SalaryInfoPage()));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                salaries.amount,
                style: const TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: -0.32,
                  color: Color(0xFF252525),
                ),
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  BuildDetail(text: 'ИТ-аналитик'),
                  BuildDetail(text: salaries.date),
                  BuildDetail(text: salaries.amount),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildDetail extends StatelessWidget {
  final String text;
  const BuildDetail({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, size: 4, color: Color(0xFF818181)),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: -0.408,
            color: Color(0xFF818181),
          ),
        ),
      ],
    );
  }
}
