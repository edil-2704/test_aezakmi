import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class EmployeesInfoPage extends StatelessWidget {
  const EmployeesInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController commentsController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Данные сотрудника'),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(CupertinoIcons.eyedropper_full),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 1,
                child: Text('Option 1'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Option 2'),
              ),
            ],
            onSelected: (value) {
              // Handle menu selection
              print('Selected: $value');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            CommonEmployeeInfoCard(),
            SizedBox(height: 20.h),
            CommonEmployeeInfoCard(),
            SizedBox(height: 20.h),
            CommonEmployeeInfoCard(),
            SizedBox(height: 20.h),
            CommonEmployeeInfoCard(),
            SizedBox(height: 20.h),
            CommonEmployeeInfoCard(),
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
              onPressed: () {},
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

class CommonEmployeeInfoCard extends StatelessWidget {
  const CommonEmployeeInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      width: 358.w,
      child: Card(
        child: Text(
          'Кудрявцев Владимир Андреевич',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
