import 'package:flutter/material.dart';
import 'package:test_aezakmi/features/finance/presentation/widgets/warning_page_widgets.dart';

class WarningPage extends StatelessWidget {
  const WarningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListTile(
              title: 'Сотрудник',
              trailing: Icons.arrow_forward_ios,
              onTap: () {
                // Handle employee selection
              },
            ),
            const SizedBox(height: 12),
            const CustomListTile(title: 'Данные о выговоре'),
            const SizedBox(height: 12),
            const CustomListTile(title: 'Выговор'),
            const SizedBox(height: 12),
            CustomListTile(
              title: 'Дата',
              trailing: Icons.arrow_forward_ios,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  // Handle selected date
                  debugPrint('Selected Date: $selectedDate');
                }
              },
            ),
            const SizedBox(height: 12),
            const CustomListTile(title: 'Сумма'),
            const SizedBox(height: 12),
            const CommentBox(),
          ],
        ),
      ),
    );
  }
}






