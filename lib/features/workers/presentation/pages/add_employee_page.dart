import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/finance_page.dart';
import 'package:test_aezakmi/features/workers/domain/repository/employee_repository.dart';
import 'package:test_aezakmi/features/workers/presentation/logic/bloc/employee_bloc.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/employees_info_page.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/saved_employee_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Создание контроллеров
    TextEditingController nameController = TextEditingController();
    TextEditingController employeeController = TextEditingController();
    TextEditingController salaryController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController commentsController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Добавить сотрудника'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            CommonTextFieldForm(
              hintText: 'Name',
              controller: nameController,
            ),
            SizedBox(height: 20.h),
            CommonTextFieldForm(
              hintText: 'Employee',
              controller: employeeController,
            ),
            SizedBox(height: 20.h),
            CommonTextFieldForm(
              hintText: 'Salary',
              controller: salaryController,
            ),
            SizedBox(height: 20.h),
            CommonTextFieldForm(
              hintText: 'Phone',
              controller: phoneController,
            ),
            SizedBox(height: 20.h),
            CommonTextFieldForm(
              hintText: 'Date',
              controller: dateController,
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 163.h,
              child: CommonTextFieldForm(
                hintText: 'Comments',
                controller: commentsController,
                maxLines: 5,
              ),
            ),
            Spacer(),
            CustomTextButton(
              onPressed: () {
                // Здесь вы можете обработать данные
                String name = nameController.text;
                String employee = employeeController.text;
                String salary = salaryController.text;
                String phone = phoneController.text;
                String date = dateController.text;
                String comments = commentsController.text;

                // Валидация данных (пример)
                if (name.isEmpty ||
                    employee.isEmpty ||
                    salary.isEmpty ||
                    phone.isEmpty ||
                    date.isEmpty) {
                  // Покажите сообщение об ошибке или подсветите поля
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Пожалуйста, заполните все поля.')),
                  );
                  return;
                }

                // Если все поля заполнены, переходите к следующему экрану
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedEmployeePage(
                      tittle: 'Сохранено!',
                      btnTittle: 'to employees',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeesInfoPage(),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              text: 'Save',
              height: 62.h,
              width: 358.w,
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeePage2 extends StatelessWidget {
  const EmployeePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeBloc(repository: EmployeeRepositoryImpl())
        ..add(FetchEmployees()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Сотрудники',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EmployeeLoadedState) {
              return ListView.separated(
                padding: EdgeInsets.all(16.0),
                itemCount: state.employees.length,
                itemBuilder: (context, index) {
                  final employee = state.employees[index];
                  return EmployeeCard(
                    name: employee.name,
                    jobTitle: employee.jobTitle,
                    salary: employee.salary,
                    date: employee.dateOfHire,
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            } else if (state is EmployeeErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const Center(child: Text('No employees found'));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to add employee page or show a dialog
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
