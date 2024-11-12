import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/finance_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class EmployeesInfoPage extends StatelessWidget {
  const EmployeesInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        EmployeeCard(
                            name: 'name',
                            jobTitle: 'jobTitle',
                            date: 'date',
                            salary: 'salary,'),
                        SizedBox(
                          height: 163.h,
                          child: CommonTextFieldForm(
                            hintText: 'Comments',
                            controller: commentsController,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.h);
                  },
                ),
              ],
            ),
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
