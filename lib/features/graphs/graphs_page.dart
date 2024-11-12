import 'package:flutter/material.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/test.dart';

class GraphsPage extends StatefulWidget {
  const GraphsPage({super.key});

  @override
  State<GraphsPage> createState() => _GraphsPageState();
}

class _GraphsPageState extends State<GraphsPage> {
  int selectedDateIndex = 0;

  void handleDateSelected(int index) {
    setState(() {
      selectedDateIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('График',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 34,
              color: Color(0xFF252525),
            )),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Январь',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF252525),
                  )),
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
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: _buildScheduleList(),
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
              builder: (context) => AddGraphPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDateSelector() {
    final days = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];
    final dates = ['13', '14', '15', '16', '17', '18', '19'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        final isSelected = index == 0;
        return InkWell(
          onTap: () {},
          child: Container(
            width: 44,
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
                Text(days[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: isSelected
                          ? const Color(0xFFF2F2EA)
                          : const Color(0xFF252525),
                    )),
                const SizedBox(height: 4),
                Text(dates[index],
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: isSelected
                          ? const Color(0xFFF2F2EA)
                          : const Color(0xFF252525),
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }

  List<Widget> _buildScheduleList() {
    final schedules = [
      {'name': 'Анохин В.А', 'time': '08:00 - 18:00'},
      {'name': 'Агапов И.Я', 'time': '09:30 - 18:00'},
      {'name': 'Брагина Г.С', 'time': '08:00 - 18:00'},
      {'name': 'Вовилов Б.Б', 'time': '09:30 - 18:00'},
      {'name': 'Дарина П.А', 'time': '08:00 - 18:00'},
      {'name': 'Зуева М.М', 'time': '10:00 - 18:00'},
      {'name': 'Зыкин П.А', 'time': 'Выходной'},
    ];
    return schedules.map((schedule) {
      final isHoliday = schedule['time'] == 'Выходной';
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isHoliday ? const Color(0xFFE5FFE9) : const Color(0xFFF2F5F7),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(schedule['name']!,
                style: const TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF252525),
                )),
            Text(schedule['time']!,
                style: const TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF252525),
                )),
          ],
        ),
      );
    }).toList();
  }
}

class DateSelector extends StatelessWidget {
  final List<String> days;
  final List<String> dates;
  final int selectedIndex;
  final Function(int) onDateSelected;

  const DateSelector({
    Key? key,
    required this.days,
    required this.dates,
    this.selectedIndex = 0,
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
            width: 44,
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

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int selectedDateIndex = 0;

  void handleDateSelected(int index) {
    setState(() {
      selectedDateIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DateSelector(
          days: ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'],
          dates: ['13', '14', '15', '16', '17', '18', '19'],
          selectedIndex: selectedDateIndex,
          onDateSelected: handleDateSelected,
        ),
      ),
    );
  }
}
