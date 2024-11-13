import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalaryInfoPage extends StatelessWidget {
  const SalaryInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
        title: const Text(
          'Данные о зарплате',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xFF252525),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildInfoCard('Сотрудник', 'Кудрявцев Владимир Андреевич'),
            _buildInfoCard('Должность', 'ИТ - аналитик'),
            _buildInfoCard('Расчетный период', '10.12.2023 - 10.01.2024'),
            _buildInfoCard('Зарплата', '100 000 ₽'),
            _buildBonusesAndPenaltiesSection(),
            _buildInfoCard('Итоговая сумма', '100 000 ₽',
                isIconVisible: true, context: context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value,
      {bool isIconVisible = false, BuildContext? context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'SF Compact Display',
              fontSize: 14,
              color: Color(0xFF818181),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F5F7),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    color: Color(0xFF252525),
                  ),
                ),
                if (isIconVisible)
                  IconButton(
                    onPressed: () {
                      _showTooltip(context!);
                    },
                    icon: const Icon(Icons.help_outline, color: Colors.grey),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBonusesAndPenaltiesSection() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Штрафы и премии',
            style: TextStyle(
              fontFamily: 'SF Compact Display',
              fontSize: 14,
              color: Color(0xFF818181),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F5F7),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              children: [
                _buildBonusOrPenaltyRow(
                    Icons.add, Colors.green, '+ 5 000 ₽', '10.12.2023'),
                SizedBox(height: 16.h),
                _buildBonusOrPenaltyRow(
                    Icons.remove, Colors.red, '- 5 000 ₽', '10.01.2024'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBonusOrPenaltyRow(
      IconData icon, Color iconColor, String amount, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: iconColor.withOpacity(0.2),
              child: Icon(icon, color: iconColor),
            ),
            SizedBox(width: 12.w),
            Text(
              amount,
              style: const TextStyle(
                fontFamily: 'SF Pro Text',
                fontSize: 16,
                color: Color(0xFF252525),
              ),
            ),
          ],
        ),
        Text(
          date,
          style: const TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 16,
            color: Color(0xFF818181),
          ),
        ),
      ],
    );
  }

  void _showTooltip(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: SizedBox(
            child: const Text(
                'Расчёт производитсяна основе указанной заработной платы, а также учёта штрафов и премий.'),
          ),
        );
      },
    );
  }
}
