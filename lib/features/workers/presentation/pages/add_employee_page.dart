import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/employees_info_page.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/saved_employee_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
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
              controller: nameController,
            ),
            SizedBox(height: 20.h),
            CommonTextFieldForm(
              hintText: 'Salary',
              controller: nameController,
            ),
            SizedBox(height: 20.h),
            CommonTextFieldForm(
              hintText: 'Phone',
              controller: nameController,
            ),
            SizedBox(height: 20.h),
            CommonTextFieldForm(
              hintText: 'Date',
              controller: nameController,
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
