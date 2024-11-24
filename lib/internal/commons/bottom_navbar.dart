import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/finance_page.dart';
import 'package:test_aezakmi/features/schedule/presentation/pages/test_grah.dart';
import 'package:test_aezakmi/features/news/news_page.dart';
import 'package:test_aezakmi/features/settings/presentation/pages/profile_page.dart';
import 'package:test_aezakmi/features/employee/presentation/pages/employee_page.dart';

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
    FinancePage(),
    //Эпизоды
    GraphsPage(),
    //настройки
    NewsPage(),

    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 12),
        iconSize: 24,
        unselectedFontSize: 12,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: 'Сотрудники',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/finanence.svg'),
            label: 'Финансы',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/calendar.svg'),
            label: 'График',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/news.svg'),
            label: 'Новости',
          ),
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
