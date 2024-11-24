import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/employee/presentation/pages/saved_employee_page.dart';
import 'package:test_aezakmi/features/employee/presentation/widget/text_buttons.dart';

class AddGraphPage extends StatelessWidget {
  const AddGraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Добавить график'),
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/delete.svg'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BuildInputField(
                hint: 'Сотрудник', maxLines: 1, isNavigatable: true),
            const SizedBox(height: 12),
            BuildDateInputField(
                hint: 'Рабочий период', maxLines: 1, isNavigatable: true),
            const SizedBox(height: 12),
            const Text(
              'Рабочее время',
              style: TextStyle(
                color: Color(0xFF818181),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: BuildInputField(
                      hint: 'с', maxLines: 1, isNavigatable: false),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: BuildInputField(
                      hint: 'до', maxLines: 1, isNavigatable: false),
                ),
              ],
            ),
            const SizedBox(height: 12),
            BuildDateInputField(
                hint: 'Выходной', maxLines: 1, isNavigatable: true),
            const Spacer(),
            CustomTextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomSavedPage(
                      tittle: 'Сохранено!',
                      btnTittle: 'К графику',
                      onTap: () {},
                    ),
                  ),
                );
              },
              text: 'Сохранить',
              height: 62.0,
              width: 358.0,
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
  final String? initialValue;

  const BuildInputField({
    super.key,
    required this.isNavigatable,
    required this.maxLines,
    required this.hint,
    this.initialValue,
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
                      title: const Text('Выберите сотрудника'),
                      content: Column(
                        children: employees
                            .map(
                              (employee) => CupertinoDialogAction(
                                onPressed: () {
                                  setState(() {
                                    selectedEmployee = employee['name'];
                                    Navigator.pop(context); // Close dialog
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      employee['name']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      employee['role']!,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text('Отмена'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1),
        ),
      ),
      controller: TextEditingController(text: selectedEmployee),
    );
  }
}

class BuildDateInputField extends StatefulWidget {
  final String hint;
  final bool isNavigatable;
  final int maxLines;
  final String? initialValue;

  const BuildDateInputField({
    super.key,
    required this.isNavigatable,
    required this.maxLines,
    required this.hint,
    this.initialValue,
  });

  @override
  State<BuildDateInputField> createState() => _BuildDateInputFieldState();
}

class _BuildDateInputFieldState extends State<BuildDateInputField> {
  String? selectedEmployee;
  String? selectedDate;
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    commentController.text = widget.initialValue ?? '';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime initialDate = DateTime.now();
    final DateTime firstDate = DateTime(2000);
    final DateTime lastDate = DateTime(2101);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate =
            "${picked.toLocal()}".split(' ')[0]; // Format: yyyy-mm-dd
        // Update the text field with the selected date
        commentController.text = selectedDate!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: commentController, // Use the same controller here
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: widget.isNavigatable
            ? IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              )
            : IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_today,
                  size: 16,
                ),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1),
        ),
      ),
    );
  }
}
