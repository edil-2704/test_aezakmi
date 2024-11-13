import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/workers/data/model/employee_model.dart';
import 'package:test_aezakmi/features/workers/presentation/logic/bloc/employee_bloc.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/saved_employee_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';
import 'package:test_aezakmi/internal/dependencies/get_it.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final EmployeeBloc bloc = getIt<EmployeeBloc>();

  TextEditingController nameController = TextEditingController();
  TextEditingController employeeController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  @override
  void initState() {
    bloc.add(
      SaveEmployeeEvent(
        employee: Employee(
          id: '',
          name: nameController.text,
          jobTitle: employeeController.text,
          dateOfHire: dateController.text,
          salary: salaryController.text,
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                // Dispatch the SaveEmployeeEvent when the button is pressed
                bloc.add(SaveEmployeeEvent(
                  employee: Employee(
                    id: '',
                    name: nameController.text,
                    jobTitle: employeeController.text,
                    dateOfHire: dateController.text,
                    salary: salaryController.text,
                  ),
                ));
              },
              text: 'Save',
              height: 62.h,
              width: 358.w,
            ),
            // Listen for states and show the result
            BlocConsumer<EmployeeBloc, EmployeeState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is EmployeeErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Error')));
                } else if (state is EmployeeSaved) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedEmployeePage(
                        tittle: 'Employee Saved',
                        btnTittle: 'Go Back',
                        onTap: () {
                          Navigator.pop(
                              context); // Go back to the previous screen
                        },
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is EmployeeLoadingState) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
