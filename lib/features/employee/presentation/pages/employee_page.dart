import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/employee/presentation/logic/bloc/employee_bloc.dart';
import 'package:test_aezakmi/features/employee/presentation/pages/add_employee_page.dart';
import 'package:test_aezakmi/features/employee/presentation/pages/custom_empty_state.dart';
import 'package:test_aezakmi/features/employee/presentation/widget/custom_employee_card.dart';
import 'package:test_aezakmi/internal/dependencies/get_it.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final EmployeeBloc bloc = getIt<EmployeeBloc>();

  @override
  void initState() {
    bloc.add(FetchEmployees());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Сотрудники',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Stack(
          children: [
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is EmployeeLoadingState) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                if (state is EmployeeLoadedState) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.employees.length,
                    itemBuilder: (context, index) {
                      final employee = state.employees[index];
                      return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => EmployeesInfoPage(),
                          //   ),
                          // );
                        },
                        child: EmployeeCard(
                          name: employee.name,
                          jobTitle: employee.jobTitle,
                          salary: employee.salary,
                          date: employee.dateOfHire,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                  );
                }
                if (state is EmployeeErrorState) {
                  return Center(
                    child: EmptyStatePage(
                      pathToPic: 'assets/images/add_people.png',
                      appBarTittle: 'appBarTittle',
                      actions: [
                        Icon(Icons.ac_unit),
                      ],
                    ),
                  );
                }
                return Center(
                  child: EmptyStatePage(
                    pathToPic: 'assets/images/add_people.png',
                    appBarTittle: 'appBarTittle',
                    actions: [Icon(Icons.ac_unit)],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEmployeePage(),
            ),
          );
        },
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        child: SvgPicture.asset(
          'assets/icons/floating.svg',
        ),
      ),
    );
  }
}
