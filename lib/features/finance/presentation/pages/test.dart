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
            _buildListTile(
                title: 'Сотрудник', trailing: Icons.arrow_forward_ios),
            const SizedBox(height: 12),
            _buildListTile(title: 'Данные о выговоре'),
            const SizedBox(height: 12),
            _buildListTile(title: 'Выговор'),
            const SizedBox(height: 12),
            _buildListTile(title: 'Дата', trailing: Icons.arrow_forward_ios),
            const SizedBox(height: 12),
            _buildListTile(title: 'Сумма'),
            const SizedBox(height: 12),
            _buildCommentBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({required String title, IconData? trailing}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F7),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontFamily: 'SF Compact Display',
              color: Color(0xFF818181),
              letterSpacing: -0.4,
            ),
          ),
          if (trailing != null) Icon(trailing, size: 16.0, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildCommentBox() {
    return Container(
      height: 131.0,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F7),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: const Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Комментарий',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'SF Compact Display',
            color: Color(0xFF818181),
            letterSpacing: -0.4,
          ),
        ),
      ),
    );
  }
}

class AddGraphPage extends StatelessWidget {
  const AddGraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Добавить график'),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BuildInputField(
                hint: 'Сотрудник', maxLines: 1, isNavigatable: true),
            const SizedBox(height: 12),
            BuildInputField(
                hint: 'Рабочий период', maxLines: 1, isNavigatable: true),
            const SizedBox(height: 12),
            const Text('Рабочее время',
                style: TextStyle(color: Color(0xFF818181))),
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
            BuildInputField(hint: 'Выходной', maxLines: 1, isNavigatable: true),
            const Spacer(),
            CustomTextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditChartPage()));
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

class EditChartPage extends StatelessWidget {
  const EditChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Редактировать график'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.red),
          )
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
            ),
            const SizedBox(height: 12),
            BuildInputField(
              hint: 'Рабочий период',
              maxLines: 1,
              isNavigatable: true,
              initialValue: '13 января 2023 - 17 февраля 2023',
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
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: BuildInputField(
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

// class BuildInputField2 extends StatefulWidget {
//   final String hint;
//   final bool isNavigatable;
//   final int maxLines;
//   final String? initialValue;

//   const BuildInputField2({
//     super.key,
//     required this.isNavigatable,
//     required this.maxLines,
//     required this.hint,
//     this.initialValue,
//   });

//   @override
//   State<BuildInputField> createState() => _BuildInputFieldState();
// }

// class _BuildInputFieldState extends State<BuildInputField> {
//   late TextEditingController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController(text: widget.initialValue);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       maxLines: widget.maxLines,
//       decoration: InputDecoration(
//         hintText: widget.hint,
//         suffixIcon: widget.isNavigatable
//             ? IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.arrow_forward_ios,
//                   size: 16,
//                 ),
//               )
//             : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(13),
//           borderSide: BorderSide.none,
//         ),
//         filled: true,
//         fillColor: Colors.grey.shade200,
//       ),
//       controller: controller,
//     );
//   }
// }
