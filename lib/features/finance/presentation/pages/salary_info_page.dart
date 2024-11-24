import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';

class SalaryInfoPage extends StatelessWidget {
  const SalaryInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBackground,
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
            const InfoCard(
                label: 'Сотрудник', value: 'Кудрявцев Владимир Андреевич'),
            const InfoCard(label: 'Должность', value: 'ИТ - аналитик'),
            const InfoCard(
                label: 'Расчетный период', value: '10.12.2023 - 10.01.2024'),
            const InfoCard(label: 'Зарплата', value: '100 000 ₽'),
            const BonusesAndPenaltiesSection(),
            InfoCard(
              label: 'Итоговая сумма',
              value: '100 000 ₽',
              isIconVisible: true,
              onIconPressed: () => _showTooltip(context),
            ),
          ],
        ),
      ),
    );
  }

  static void _showTooltip(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CupertinoAlertDialog(
          content: Text(
              'Расчёт производится на основе указанной заработной платы, а также учёта штрафов и премий.'),
        );
      },
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final bool isIconVisible;
  final VoidCallback? onIconPressed;

  const InfoCard({
    super.key,
    required this.label,
    required this.value,
    this.isIconVisible = false,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 16,
                      color: Color(0xFF252525),
                    ),
                  ),
                ),
                if (isIconVisible)
                  IconButton(
                    onPressed: onIconPressed,
                    icon: const Icon(Icons.help_outline, color: Colors.grey),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BonusesAndPenaltiesSection extends StatelessWidget {
  const BonusesAndPenaltiesSection({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: const [
                BonusOrPenaltyRow(
                  icon: Icons.add,
                  iconColor: Colors.green,
                  amount: '+ 5 000 ₽',
                  date: '10.12.2023',
                ),
                SizedBox(height: 16),
                BonusOrPenaltyRow(
                  icon: Icons.remove,
                  iconColor: Colors.red,
                  amount: '- 5 000 ₽',
                  date: '10.01.2024',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BonusOrPenaltyRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String amount;
  final String date;

  const BonusOrPenaltyRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
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
}
