import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/test.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/employee_page.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/saved_employee_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage>
    with SingleTickerProviderStateMixin {
  DateTime? pickedDate;
  late TabController tabController;

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
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (date != null) {
      setState(() => pickedDate = date);
    }
  }

  String getFormattedDate() {
    return pickedDate == null
        ? 'Выберите дату'
        : '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}';
  }

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

  Widget buildFloatingActionButton() {
    final pages = [
      WarningPage(),
      AddBonusPage(),
      AddSalaryPage(),
    ];
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pages[tabController.index],
          ),
        );
      },
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      child: SvgPicture.asset('assets/icons/floating.svg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Финансы',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
        ),
        actions: [
          CustomTextButton(
            height: 30.h,
            icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
            width: 90.w,
            text: 'Filter',
            onPressed: () => _pickDate(context),
          ),
          const SizedBox(width: 16),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: const [
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
          BuildFinanceReprimand(),
          BuildFinanceBonus(text: getFormattedDate()),
          ApartmentsPage(),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }
}

class BuildFinanceReprimand extends StatelessWidget {
  const BuildFinanceReprimand({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) => SizedBox(
          height: 113.h,
          width: 358.w,
          child: CustomEmployeeCard(),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
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
          Chip(
            label: Text(
              '$text',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 20.h),
          Text('data2', style: TextStyle(fontSize: 14.sp)),
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
      itemBuilder: (context, index) => SizedBox(
        height: 113.h,
        width: 358.w,
        child: CustomEmployeeCard(),
      ),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
    );
  }
}

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
            buildInputField('Сотрудник', isNavigatable: true),
            const SizedBox(height: 12),
            buildInputField('Данные о выговоре', isNavigatable: true),
            const SizedBox(height: 12),
            buildInputField('Выговор'),
            const SizedBox(height: 12),
            buildInputField('Дата', isNavigatable: true),
            const SizedBox(height: 12),
            buildInputField('Сумма'),
            const SizedBox(height: 12),
            buildInputField('Комментарий', maxLines: 5),
            const Spacer(),
            SizedBox(
              height: 62.h,
              width: 358.w,
              child: CustomTextButton(
                text: 'Save',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedEmployeePage(
                        tittle: 'Сохранено!',
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FinancePage()),
                          );
                        },
                        btnTittle: 'to finance',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(String hint,
      {bool isNavigatable = false, int maxLines = 1}) {
    return TextField(
      readOnly: isNavigatable,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: isNavigatable
            ? const Icon(Icons.arrow_forward_ios, size: 16)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}

class AddBonusPage extends StatelessWidget {
  const AddBonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bonus'), leading: const BackButton()),
    );
  }
}

class AddSalaryPage extends StatelessWidget {
  const AddSalaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salary')),
    );
  }
}

/////

class ApartmentsPage extends StatelessWidget {
  const ApartmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: BuildEmployeeCard()),
        ],
      ),
    );
  }
}

class BuildEmployeeCard extends StatelessWidget {
  const BuildEmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        EmployeeCard(
          name: 'Кудрявцев Владимир Андреевич',
          jobTitle: 'ИТ-аналитик',
          date: '20 января 2024',
          salary: '100 000 ₽',
        ),
        EmployeeCard(
          name: 'Колесников Даниил Фёдорович',
          jobTitle: 'Сетевой администратор',
          date: '20 января 2024',
          salary: '80 000 ₽',
        ),
        EmployeeCard(
          name: 'Попова Анастасия Вадимовна',
          jobTitle: 'Сетевой инженер',
          date: '20 января 2024',
          salary: '95 000 ₽',
        ),
        EmployeeCard(
          name: 'Соловьева София Олеговна',
          jobTitle: 'Администратор сетей и компьютерных систем',
          date: '20 января 2024',
          salary: '95 000 ₽',
        ),
      ],
    );
  }
}

class EmployeeCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String date;
  final String salary;

  const EmployeeCard(
      {required this.name,
      required this.jobTitle,
      required this.date,
      required this.salary,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, color: Color(0xFF2253F6)),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.circle, size: 4, color: Color(0xFF818181)),
                const SizedBox(width: 8),
                Text(
                  jobTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF818181),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.circle, size: 4, color: Color(0xFF818181)),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF818181),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.circle, size: 4, color: Color(0xFF818181)),
                const SizedBox(width: 8),
                Text(
                  salary,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF818181),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
