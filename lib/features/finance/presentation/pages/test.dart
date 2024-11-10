import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class AddWarningPage extends StatelessWidget {
  const AddWarningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Добавить выговор'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BuildInputField(
              hint: 'Сотрудник',
              maxLines: 1,
              isNavigatable: true,
            ),
            const SizedBox(height: 12),
            BuildInputField(
              hint: 'Комментарий',
              maxLines: 1,
              isNavigatable: true,
            ),
            const SizedBox(height: 12),
            BuildInputField(
              hint: 'Комментарий',
              maxLines: 1,
              isNavigatable: true,
            ),
            const SizedBox(height: 12),
            BuildInputField(
              hint: 'Комментарий',
              maxLines: 1,
              isNavigatable: true,
            ),
            const SizedBox(height: 12),
            BuildInputField(
              hint: 'Комментарий',
              maxLines: 5,
              isNavigatable: true,
            ),
            const Spacer(),
            CustomTextButton(
              onPressed: () {},
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

class BuildInputField extends StatefulWidget {
  final String hint;
  final bool isNavigatable;
  final int maxLines;

  const BuildInputField({
    super.key,
    required this.isNavigatable,
    required this.maxLines,
    required this.hint,
  });

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}

class _BuildInputFieldState extends State<BuildInputField> {
  String? selectedEmployee;
  final TextEditingController commentController = TextEditingController();

  final List<Map<String, String>> employees = [
    {'name': 'Федотова Елизавета Никитична', 'role': 'Сетевой администратор'},
    {'name': 'Федоров Владимир Андреевич', 'role': 'IT-аналитик'},
    {'name': 'Филоненко Анастасия Вадимовна', 'role': 'Сетевой инженер'},
  ];

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: widget.isNavigatable
            ? IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: Text('Выберите сотрудника'),
                      content: Column(
                        children: employees
                            .map(
                              (employee) => CupertinoDialogAction(
                                onPressed: () {
                                  setState(() {
                                    selectedEmployee = employee['name'];
                                    Navigator.pop(context); // Закрываем диалог
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      employee['name']!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      employee['role']!,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: Text('Отмена'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      controller: TextEditingController(text: selectedEmployee),
    );
  }
}
