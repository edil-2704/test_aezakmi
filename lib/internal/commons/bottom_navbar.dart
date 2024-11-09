import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/home/presentation/pages/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  void onItemTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens = [
    //персонажи
    EmployeePage(),
    //локация
    EmployeePage(),
    //Эпизоды
    EmployeePage(),
    //настройки
    EmployeePage(),

    EmployeePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screens.elementAt(selectedIndex),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: 'Сотрудники',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/finanence.svg'),
              label: 'Локациии'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/calendar.svg'),
            label: 'График',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/news.svg'),
              label: 'Эпизоды'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/settings.svg'),
            label: 'Настройки',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTab,
      ),
    );
  }
}
