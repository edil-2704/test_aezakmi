import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/employee/presentation/pages/saved_employee_page.dart';
import 'package:test_aezakmi/features/employee/presentation/widget/text_buttons.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/test.dart';

class GraphsPage extends StatefulWidget {
  const GraphsPage({super.key});

  @override
  State<GraphsPage> createState() => _GraphsPageState();
}

class _GraphsPageState extends State<GraphsPage> {
  int selectedDateIndex = 0;

  final List<List<Schedule>> schedulesPerDate = [
    [Schedule(name: 'Анохин В.А', time: '08:00 - 18:00')],
    [Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00')],
    [Schedule(name: 'Брагина Г.С', time: '08:00 - 18:00')],
    [Schedule(name: 'Вовилов Б.Б', time: '09:30 - 18:00')],
    [Schedule(name: 'Дарина П.А', time: '08:00 - 18:00')],
    [Schedule(name: 'Зуева М.М', time: '10:00 - 18:00')],
    [Schedule(name: 'Зыкин П.А', time: 'Выходной')],
  ];

  void handleDateSelected(int index) {
    setState(() {
      selectedDateIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'График',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 34,
            color: Color(0xFF252525),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Январь',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF252525),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DateSelector(
              days: ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'],
              dates: ['13', '14', '15', '16', '17', '18', '19'],
              selectedIndex: selectedDateIndex,
              onDateSelected: handleDateSelected,
            ),
          ),
          Expanded(
            child: ScheduleList(
              schedules: schedulesPerDate[selectedDateIndex],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2253F6),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddGraphPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Schedule {
  final String name;
  final String time;

  Schedule({required this.name, required this.time});
}

class ScheduleList extends StatelessWidget {
  final List<Schedule> schedules;

  const ScheduleList({Key? key, required this.schedules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        final schedule = schedules[index];
        final isHoliday = schedule.time == 'Выходной';
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 54.h,
            width: 358.w,
            decoration: BoxDecoration(
              color:
                  isHoliday ? const Color(0xFFE5FFE9) : const Color(0xFFF2F5F7),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    schedule.name,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF252525),
                    ),
                  ),
                  Text(
                    schedule.time,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF252525),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
    );
  }
}

class DateSelector extends StatelessWidget {
  final List<String> days;
  final List<String> dates;
  final int selectedIndex;
  final ValueChanged<int> onDateSelected;

  const DateSelector({
    Key? key,
    required this.days,
    required this.dates,
    required this.selectedIndex,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        final isSelected = index == selectedIndex;
        return InkWell(
          onTap: () => onDateSelected(index),
          child: Container(
            width: 44.w,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF2253F6)
                  : const Color(0xFFF2F5F7),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  days[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: isSelected
                        ? const Color(0xFFF2F2EA)
                        : const Color(0xFF252525),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dates[index],
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isSelected
                        ? const Color(0xFFF2F2EA)
                        : const Color(0xFF252525),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

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
            icon: const Icon(Icons.delete, color: Colors.red),
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
        fillColor: const Color(0xFFF2F5F7),
      ),
    );
  }
}
