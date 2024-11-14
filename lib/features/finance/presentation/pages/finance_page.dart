import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/finance/presentation/logic/bloc/finance_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/bonus_tab.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/filter_plus_page.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/salary_tabs.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/warning_tabs.dart';
import 'package:test_aezakmi/features/employee/presentation/widget/text_buttons.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';
import 'package:test_aezakmi/internal/dependencies/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Future<void> _pickDate(BuildContext context) async {
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
            backgroundColor: AppColors.mainBackground,
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
                onPressed: () {
                  return _pickDate;
                },
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
              BonusesTab(
                labelText: pickedDate.toString(),
              ),
              SalariesTabs(),
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
