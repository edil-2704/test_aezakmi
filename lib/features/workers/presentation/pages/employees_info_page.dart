import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/add_employee_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';
import 'package:test_aezakmi/internal/commons/common_text_field_widget.dart';
import 'package:test_aezakmi/internal/commons/common_text_widget.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';

class EmployeesInfoPage extends StatefulWidget {
  const EmployeesInfoPage({super.key});

  @override
  _EmployeesInfoPageState createState() => _EmployeesInfoPageState();
}

class _EmployeesInfoPageState extends State<EmployeesInfoPage> {
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController nameController1 = TextEditingController();
  final TextEditingController nameController2 = TextEditingController();
  final TextEditingController nameController3 = TextEditingController();
  final TextEditingController nameController4 = TextEditingController();
  final TextEditingController nameController5 = TextEditingController();

  @override
  void dispose() {
    commentsController.dispose();
    nameController1.dispose();
    nameController2.dispose();
    nameController3.dispose();
    nameController4.dispose();
    nameController5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Данные сотрудника'),
        actions: [
          PopupMenuButton<int>(
            icon: SvgPicture.asset('assets/icons/edit.svg'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/edit.svg'),
                    SizedBox(width: 5),
                    Text(
                      'Edit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/delete.svg'),
                    SizedBox(width: 5),
                    Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.mainRed,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddEmployeePage()));
              } else {
                Navigator.pop(context);
              }
              print('Selected: $value');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidget(tittle: 'Title 1'),
            SizedBox(height: 20.h),
            CommonTextFieldWidget(
              controller: nameController1,
              hintText: 'Name 1',
            ),
            SizedBox(height: 20.h),
            CommonTextWidget(tittle: 'Title 2'),
            SizedBox(height: 20.h),
            CommonTextFieldWidget(
              controller: nameController2,
              hintText: 'Name 2',
            ),
            SizedBox(height: 20.h),
            CommonTextWidget(tittle: 'Title 3'),
            SizedBox(height: 20.h),
            CommonTextFieldWidget(
              controller: nameController3,
              hintText: 'Name 3',
            ),
            SizedBox(height: 20.h),
            CommonTextWidget(tittle: 'Title 4'),
            SizedBox(height: 20.h),
            CommonTextFieldWidget(
              controller: nameController4,
              hintText: 'Name 4',
            ),
            SizedBox(height: 20.h),
            CommonTextWidget(tittle: 'Title 5'),
            SizedBox(height: 20.h),
            CommonTextFieldWidget(
              controller: nameController5,
              hintText: 'Name 5',
            ),
            Spacer(),
            CustomTextButton(
              onPressed: () {
                // Handle save action
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
