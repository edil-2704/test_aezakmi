import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/test.dart';

// class GraphsPage extends StatefulWidget {
//   const GraphsPage({super.key});

//   @override
//   State<GraphsPage> createState() => _GraphsPageState();
// }

// class _GraphsPageState extends State<GraphsPage> {
//   int selectedDateIndex = 0;

//   void handleDateSelected(int index) {
//     setState(() {
//       selectedDateIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: const Text('График',
//             style: TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 34,
//               color: Color(0xFF252525),
//             )),
//         centerTitle: false,
//       ),
//       body: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text('Январь',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                     color: Color(0xFF252525),
//                   )),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: DateSelector(
//               days: ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'],
//               dates: ['13', '14', '15', '16', '17', '18', '19'],
//               selectedIndex: selectedDateIndex,
//               onDateSelected: handleDateSelected,
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               children: _buildScheduleList(),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFF2253F6),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddGraphPage(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Widget _buildDateSelector() {
//     final days = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];
//     final dates = ['13', '14', '15', '16', '17', '18', '19'];

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: List.generate(days.length, (index) {
//         final isSelected = index == 0;
//         return InkWell(
//           onTap: () {},
//           child: Container(
//             width: 44,
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? const Color(0xFF2253F6)
//                   : const Color(0xFFF2F5F7),
//               borderRadius: BorderRadius.circular(13),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(days[index],
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 10,
//                       color: isSelected
//                           ? const Color(0xFFF2F2EA)
//                           : const Color(0xFF252525),
//                     )),
//                 const SizedBox(height: 4),
//                 Text(dates[index],
//                     style: TextStyle(
//                       fontFamily: 'SF Pro Display',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14,
//                       color: isSelected
//                           ? const Color(0xFFF2F2EA)
//                           : const Color(0xFF252525),
//                     )),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }

//   List<Widget> _buildScheduleList() {
//     final schedules = [
//       {'name': 'Анохин В.А', 'time': '08:00 - 18:00'},
//       {'name': 'Агапов И.Я', 'time': '09:30 - 18:00'},
//       {'name': 'Брагина Г.С', 'time': '08:00 - 18:00'},
//       {'name': 'Вовилов Б.Б', 'time': '09:30 - 18:00'},
//       {'name': 'Дарина П.А', 'time': '08:00 - 18:00'},
//       {'name': 'Зуева М.М', 'time': '10:00 - 18:00'},
//       {'name': 'Зыкин П.А', 'time': 'Выходной'},
//     ];
//     return schedules.map((schedule) {
//       final isHoliday = schedule['time'] == 'Выходной';
//       return Container(
//         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         decoration: BoxDecoration(
//           color: isHoliday ? const Color(0xFFE5FFE9) : const Color(0xFFF2F5F7),
//           borderRadius: BorderRadius.circular(13),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(schedule['name']!,
//                 style: const TextStyle(
//                   fontFamily: 'SF Pro Text',
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16,
//                   color: Color(0xFF252525),
//                 )),
//             Text(schedule['time']!,
//                 style: const TextStyle(
//                   fontFamily: 'SF Pro Text',
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   color: Color(0xFF252525),
//                 )),
//           ],
//         ),
//       );
//     }).toList();
//   }
// }

// class DateSelector extends StatelessWidget {
//   final List<String> days;
//   final List<String> dates;
//   final int selectedIndex;
//   final Function(int) onDateSelected;

//   const DateSelector({
//     Key? key,
//     required this.days,
//     required this.dates,
//     this.selectedIndex = 0,
//     required this.onDateSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: List.generate(days.length, (index) {
//         final isSelected = index == selectedIndex;
//         return InkWell(
//           onTap: () => onDateSelected(index),
//           child: Container(
//             width: 44,
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? const Color(0xFF2253F6)
//                   : const Color(0xFFF2F5F7),
//               borderRadius: BorderRadius.circular(13),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   days[index],
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10,
//                     color: isSelected
//                         ? const Color(0xFFF2F2EA)
//                         : const Color(0xFF252525),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   dates[index],
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: isSelected
//                         ? const Color(0xFFF2F2EA)
//                         : const Color(0xFF252525),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

// class MyPage extends StatefulWidget {
//   const MyPage({super.key});

//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   int selectedDateIndex = 0;

//   void handleDateSelected(int index) {
//     setState(() {
//       selectedDateIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DateSelector(
//           days: ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'],
//           dates: ['13', '14', '15', '16', '17', '18', '19'],
//           selectedIndex: selectedDateIndex,
//           onDateSelected: handleDateSelected,
//         ),
//       ),
//     );
//   }
// }

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
    ],
    [
      Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00'),
      Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00'),
      Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00'),
      Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00'),
      Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00'),
      Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00'),
      Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00'),
      Schedule(name: 'Агапов И.Я', time: '09:30 - 18:00'),
    ],
    [
      Schedule(
        name: 'Брагина Г.С',
        time: '08:00 - 18:00',
      )
    ],
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
        title: const Text('График',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 34,
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
          SizedBox(height: 20.h),
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
              builder: (context) => AddGraphPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
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
          child: Column(
            children: [
              Container(
                height: 54.h,
                width: 358.w,
                decoration: BoxDecoration(
                  color: isHoliday
                      ? const Color(0xFFE5FFE9)
                      : const Color(0xFFF2F5F7),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        schedule.name,
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF252525),
                        ),
                      ),
                      Text(
                        schedule.time,
                        style: TextStyle(
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
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 20.h);
      },
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

class Schedule {
  final String name;
  final String time;

  Schedule({required this.name, required this.time});
}
