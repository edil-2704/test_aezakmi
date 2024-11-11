import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/employee_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage>
    with SingleTickerProviderStateMixin {
  DateTime? pickedDate;

  Future<void> _pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: pickedDate ?? DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child ?? SizedBox.shrink(),
        );
      },
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  String getFormattedDate() {
    if (pickedDate == null) return 'Выберите дату';
    return '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}';
  }

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget _buildFloatingActionButton() {
    switch (tabController.index) {
      case 0:
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddWarningPage()));
          },
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: SvgPicture.asset(
            'assets/icons/floating.svg',
          ),
        );
      case 1:
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddSalaryPage()));
          },
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: SvgPicture.asset(
            'assets/icons/floating.svg',
          ),
        );
      case 2:
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddSalaryPage()));
          },
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: SvgPicture.asset(
            'assets/icons/floating.svg',
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabController.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Финансы',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
          ),
          actions: [
            CustomTextButton(
              height: 30.h,
              icon: Icon(
                Icons.filter_alt_outlined,
                color: Colors.white,
              ),
              width: 90.w,
              text: 'Filter',
              onPressed: () {
                _pickDate(context);
              },
            ),
            SizedBox(width: 16),
          ],
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(text: 'Выговор'),
              Tab(text: 'Премия'),
              Tab(text: 'Зарплата'),
            ],
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            const BuildFinanceReprimand(),
            BuildFinanceBonus(
              text: getFormattedDate(),
            ),
            const BuildFinanceSalary(),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }
}

class BuildFinanceReprimand extends StatefulWidget {
  const BuildFinanceReprimand({super.key});

  @override
  State<BuildFinanceReprimand> createState() => _BuildFinanceReprimandState();
}

class _BuildFinanceReprimandState extends State<BuildFinanceReprimand> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 113.h,
            width: 358.w,
            child: CustomEmployeeCard(),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.h);
        },
      ),
    );
  }
}

class BuildFinanceBonus extends StatelessWidget {
  final String text;
  const BuildFinanceBonus({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Выбранная дата: $text',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20.h),
          Text(
            'data2',
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

class BuildFinanceSalary extends StatelessWidget {
  const BuildFinanceSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 113.h,
          width: 358.w,
          child: CustomEmployeeCard(),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 20.h);
      },
    );
  }
}

class AddWarningPage extends StatelessWidget {
  const AddWarningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить выговор')),
      body: Center(child: const Text('Добавить выговор')),
    );
  }
}

class AddBonusPage extends StatelessWidget {
  const AddBonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AddSalaryPage extends StatelessWidget {
  const AddSalaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
