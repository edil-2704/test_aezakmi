import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/schedule/presentation/pages/add_schedule.dart';
// import 'package:test_aezakmi/features/finance/presentation/pages/warning_page.dart';

class GraphsPage extends StatefulWidget {
  const GraphsPage({super.key});

  @override
  State<GraphsPage> createState() => _GraphsPageState();
}

class _GraphsPageState extends State<GraphsPage> {
  int selectedDateIndex = 0;

  final List<List<Schedule>> schedulesPerDate = [
    [
      Schedule(name: 'Анохин В.А', time: '08:00 - 18:00'),
      Schedule(name: 'Анохин В.А', time: '08:00 - 18:00'),
      Schedule(name: 'Анохин В.А', time: '08:00 - 18:00'),
      Schedule(name: 'Анохин В.А', time: '08:00 - 18:00'),
      Schedule(name: 'Анохин В.А', time: '08:00 - 18:00'),
      Schedule(name: 'Анохин В.А', time: '08:00 - 18:00'),
      Schedule(name: 'Анохин В.А', time: 'Выходной'),
    ],
    [
      Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00'),
    ],
    [
      Schedule(name: 'Брагина Г.С', time: '08:00 - 18:00'),
    ],
    [
      Schedule(name: 'Вовилов Б.Б', time: '09:30 - 18:00'),
    ],
    [
      Schedule(name: 'Дарина П.А', time: '08:00 - 18:00'),
    ],
    [],
    [
      Schedule(name: 'Зыкин П.А', time: 'Выходной'),
    ],
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
        centerTitle: false,
        title: const Text(
          'График',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 34,
            color: Color(0xFF252525),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Январь',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF252525),
              ),
            ),
            DateSelector(
              days: ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'],
              dates: ['13', '14', '15', '16', '17', '18', '19'],
              selectedIndex: selectedDateIndex,
              onDateSelected: handleDateSelected,
            ),
            Divider(height: 20.h),
            Expanded(
              child: ScheduleList(
                schedules: schedulesPerDate[selectedDateIndex],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddGraphPage(),
            ),
          );
        },
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        child: SvgPicture.asset('assets/icons/floating.svg'),
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
        return Container(
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
      children: List.generate(
        days.length,
        (index) {
          final isSelected = index == selectedIndex;
          return InkWell(
            onTap: () => onDateSelected(index),
            child: Container(
              width: 40.w,
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
        },
      ),
    );
  }
}
