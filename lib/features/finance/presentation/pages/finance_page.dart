import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/finance/presentation/logic/bloc/finance_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/empty_finance_state_page.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/test.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/employee_page.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/saved_employee_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';
import 'package:test_aezakmi/internal/dependencies/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class FinancePage extends StatefulWidget {
//   const FinancePage({super.key});

//   @override
//   State<FinancePage> createState() => _FinancePageState();
// }

// class _FinancePageState extends State<FinancePage>
//     with SingleTickerProviderStateMixin {
//   DateTime? pickedDate;
//   late final TabController tabController;
//   final FinanceBloc bloc = getIt<FinanceBloc>();

//   Future<void> _pickDate(BuildContext context) async {
//     DateTime? date = await showDatePicker(
//       context: context,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       initialDate: pickedDate ?? DateTime.now(),
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: Colors.blue,
//             buttonTheme: const ButtonThemeData(
//               textTheme: ButtonTextTheme.primary,
//             ),
//           ),
//           child: child ?? const SizedBox.shrink(),
//         );
//       },
//     );

//     if (date != null) {
//       setState(() => pickedDate = date);
//     }
//   }

//   String getFormattedDate() {
//     return pickedDate == null
//         ? 'Выберите дату'
//         : '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}';
//   }

//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 3, vsync: this);

//     tabController.addListener(() {
//       if (tabController.indexIsChanging) return;

//       // Dispatch appropriate event based on selected tab
//       switch (tabController.index) {
//         case 0:
//           bloc.add(FetchWarnings());
//           break;
//         case 1:
//           bloc.add(FetchBonuses());
//           break;
//         case 2:
//           bloc.add(FetchSalaries());
//           break;
//       }
//     });
//   }

//   Widget buildFloatingActionButton() {
//     final pages = [
//       WarningPage(),
//       AddBonusPage(),
//       AddSalaryPage(),
//     ];
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => pages[tabController.index],
//           ),
//         );
//       },
//       splashColor: Colors.transparent,
//       splashFactory: NoSplash.splashFactory,
//       child: SvgPicture.asset('assets/icons/floating.svg'),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Финансы',
//             style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
//           ),
//           actions: [
//             CustomTextButton(
//               height: 30.h,
//               icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
//               width: 90.w,
//               text: 'Filter',
//               onPressed: () => _pickDate(context),
//             ),
//             const SizedBox(width: 16),
//           ],
//           bottom: TabBar(
//             controller: tabController,
//             tabs: const [
//               Tab(text: 'Выговор'),
//               Tab(text: 'Премия'),
//               Tab(text: 'Зарплата'),
//             ],
//             indicatorColor: Colors.blue,
//             labelColor: Colors.black,
//           ),
//         ),
//         body: TabBarView(
//           controller: tabController,
//           children: [
//             BlocBuilder<FinanceBloc, FinanceState>(
//               bloc: bloc,
//               builder: (context, state) {
//                 if (state is FinanceLoadedWarningsState) {
//                   return ListView.separated(
//                     itemCount: 10,
//                     itemBuilder: (context, index) => SizedBox(
//                       height: 113.h,
//                       width: 358.w,
//                       child: EmployeeCard(
//                         name: state.warnings[index].name.toString(),
//                         jobTitle: state.warnings[index].details,
//                         date: '20 января 2024',
//                         salary: '100 000 ₽',
//                       ),
//                     ),
//                     separatorBuilder: (context, index) =>
//                         SizedBox(height: 20.h),
//                   );
//                 }
//                 if (state is FinanceErrorState) {
//                   return EmptyFinanceStatePage();
//                 }
//                 return SizedBox();
//               },
//             ),
//             BuildFinanceBonus(text: getFormattedDate()),
//             ApartmentsPage(),
//           ],
//         ),
//         floatingActionButton: buildFloatingActionButton(),
//       ),
//     );
//   }
// }

// class BuildFinanceBonus extends StatelessWidget {
//   final String text;
//   const BuildFinanceBonus({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Chip(
//             label: Text(
//               '$text',
//               style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
//             ),
//           ),
//           SizedBox(height: 20.h),
//           Text('data2', style: TextStyle(fontSize: 14.sp)),
//         ],
//       ),
//     );
//   }
// }

// class AddWarningPage extends StatelessWidget {
//   const AddWarningPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(),
//         title: const Text('Добавить выговор'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             buildInputField('Сотрудник', isNavigatable: true),
//             const SizedBox(height: 12),
//             buildInputField('Данные о выговоре', isNavigatable: true),
//             const SizedBox(height: 12),
//             buildInputField('Выговор'),
//             const SizedBox(height: 12),
//             buildInputField('Дата', isNavigatable: true),
//             const SizedBox(height: 12),
//             buildInputField('Сумма'),
//             const SizedBox(height: 12),
//             buildInputField('Комментарий', maxLines: 5),
//             const Spacer(),
//             SizedBox(
//               height: 62.h,
//               width: 358.w,
//               child: CustomTextButton(
//                 text: 'Save',
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SavedEmployeePage(
//                         tittle: 'Сохранено!',
//                         onTap: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const FinancePage()),
//                           );
//                         },
//                         btnTittle: 'to finance',
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildInputField(String hint,
//       {bool isNavigatable = false, int maxLines = 1}) {
//     return TextField(
//       readOnly: isNavigatable,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hint,
//         suffixIcon: isNavigatable
//             ? const Icon(Icons.arrow_forward_ios, size: 16)
//             : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide.none,
//         ),
//         filled: true,
//         fillColor: Colors.grey.shade200,
//       ),
//     );
//   }
// }

// /////

// class ApartmentsPage extends StatelessWidget {
//   const ApartmentsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(child: BuildEmployeeCard()),
//         ],
//       ),
//     );
//   }
// }

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

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final FinanceBloc bloc = getIt<FinanceBloc>();
  DateTime? pickedDate;

  Future<void> pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: pickedDate ?? DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child ?? SizedBox.shrink(),
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
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      switch (_tabController.index) {
        case 0:
          bloc.add(FetchWarnings());
          break;
        case 1:
          bloc.add(FetchBonuses());
          break;
        case 2:
          bloc.add(FetchSalaries());
          break;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: bloc,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Финансы',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            actions: [
              CustomTextButton(
                height: 30.h,
                icon:
                    const Icon(Icons.filter_alt_outlined, color: Colors.white),
                width: 90.w,
                text: 'Filter',
                onPressed: () => pickDate(context),
              ),
              const SizedBox(width: 16),
            ],
            bottom: TabBar(
              controller: _tabController,
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
            controller: _tabController,
            children: [
              WarningsTab(),
              BonusesTab(),
              SalariesTab(),
            ],
          ),
          floatingActionButton: InkWell(
            onTap: () {
              // List pages = [
              //   WarningsTab(),
              //   BonusesTab(),
              //   SalariesTab(),
              // ];

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => pages[_tabController.index],
              //   ),
              // );
            },
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            child: SvgPicture.asset('assets/icons/floating.svg'),
          ),
        ));
  }
}

class WarningsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceBloc, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FinanceLoadedWarningsState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: state.warnings.length,
              itemBuilder: (context, index) {
                final warning = state.warnings[index];
                return EmployeeCard(
                  name: warning.name,
                  jobTitle: warning.details,
                  date: warning.date,
                  salary: warning.id,
                );
              },
            ),
          );
        } else if (state is FinanceErrorState) {
          return const EmptyFinanceStatePage();
        }
        return SizedBox();
      },
    );
  }
}

class BonusesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceBloc, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FinanceLoadedBonusesState) {
          return ListView.builder(
            itemCount: state.bonuses.length,
            itemBuilder: (context, index) {
              final bonus = state.bonuses[index];
              return ListTile(
                title: Text(bonus.amount),
                subtitle: Text(bonus.date),
              );
            },
          );
        } else if (state is FinanceErrorState) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: Text('No bonuses'));
      },
    );
  }
}

class SalariesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceBloc, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FinanceLoadedSalariesState) {
          return ListView.builder(
            itemCount: state.salaries.length,
            itemBuilder: (context, index) {
              final salary = state.salaries[index];
              return ListTile(
                title: Text(salary.amount),
                subtitle: Text(salary.date),
              );
            },
          );
        } else if (state is FinanceErrorState) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: Text('No salaries'));
      },
    );
  }
}
