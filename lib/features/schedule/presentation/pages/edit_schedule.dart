import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/employee/presentation/pages/saved_employee_page.dart';
import 'package:test_aezakmi/features/employee/presentation/widget/text_buttons.dart';
import 'package:test_aezakmi/features/schedule/presentation/pages/test_grah.dart';

class EditChartPage extends StatelessWidget {
  const EditChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Редактировать график'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/delete.svg'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BuildInputField(
              hint: 'Сотрудник',
              maxLines: 1,
              isNavigatable: true,
              initialValue: 'Кудрявцев Владимир Андреевич',
              controller: controller,
            ),
            const SizedBox(height: 12),
            BuildInputField(
              hint: 'Рабочий период',
              maxLines: 1,
              isNavigatable: true,
              initialValue: '13 января 2023 - 17 февраля 2023',
              controller: controller,
            ),
            const SizedBox(height: 12),
            const Text('Рабочее время',
                style: TextStyle(color: Color(0xFF818181))),
            Row(
              children: [
                Flexible(
                  child: BuildInputField(
                    hint: 'с',
                    maxLines: 1,
                    isNavigatable: false,
                    initialValue: '08:00',
                    controller: controller,
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: BuildInputField(
                    controller: controller,
                    hint: 'до',
                    maxLines: 1,
                    isNavigatable: false,
                    initialValue: '18:00',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            BuildInputField(
              hint: 'Выходной',
              maxLines: 1,
              isNavigatable: true,
              initialValue: '18 января 2023 - 19 февраля 2023',
              controller: controller,
            ),
            const Spacer(),
            CustomTextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomSavedPage(
                          tittle: 'Сохранено!',
                          btnTittle: 'К графику',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GraphsPage()));
                          })),
                );
              },
              text: 'Сохранить',
              height: 62.h,
              width: 358.w,
            ),
          ],
        ),
      ),
    );
  }
}

class BuildInputField extends StatelessWidget {
  final String hint;
  final bool isNavigatable;
  final int maxLines;
  final String? initialValue;
  final TextEditingController controller;

  const BuildInputField({
    super.key,
    required this.isNavigatable,
    required this.maxLines,
    required this.hint,
    this.initialValue,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: TextEditingController(text: initialValue),
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: isNavigatable
            ? IconButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (selectedDate != null) {
                    controller.text =
                        "${selectedDate.day.toString().padLeft(2, '0')}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.year}";
                  }
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        filled: true,
       
      ),
    );
  }
}
