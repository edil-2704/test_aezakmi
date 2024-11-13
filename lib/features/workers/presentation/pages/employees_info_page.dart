import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_aezakmi/features/workers/data/model/employee_model.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/edit_employee.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';

class EmployeesInfoPage extends StatefulWidget {
  final Employee employee;

  const EmployeesInfoPage({Key? key, required this.employee}) : super(key: key);

  @override
  _EmployeesInfoPageState createState() => _EmployeesInfoPageState();
}

class _EmployeesInfoPageState extends State<EmployeesInfoPage> {
  late TextEditingController nameController;
  late TextEditingController jobTitleController;
  late TextEditingController salaryController;
  late TextEditingController phoneController;
  late TextEditingController registrationDateController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.employee.name);
    jobTitleController = TextEditingController(text: widget.employee.jobTitle);
    salaryController = TextEditingController(text: widget.employee.salary);
    phoneController = TextEditingController(text: widget.employee.dateOfHire);
    registrationDateController =
        TextEditingController(text: '24.01.2020'); // Example
  }

  @override
  void dispose() {
    nameController.dispose();
    jobTitleController.dispose();
    salaryController.dispose();
    phoneController.dispose();
    registrationDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
        title: const Text('Данные сотрудника',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/edit.svg'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 20.r),
        child: ListView(
          children: [
            _buildInfoField('ФИО', nameController),
            _buildInfoField('Должность', jobTitleController),
            _buildInfoField('Заработная плата', salaryController),
            _buildInfoField('Номер телефона', phoneController),
            _buildInfoField('Дата регистрации', registrationDateController),
            SizedBox(height: 20.h),
            CustomTextButton(
              onPressed: _saveEmployeeInformation,
              text: 'Сохранить',
              height: 50.h,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'SF Compact Display',
              fontSize: 14,
              color: Color(0xFF818181),
            ),
          ),
          SizedBox(height: 12.h),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF2F5F7),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 16,
              color: Color(0xFF252525),
            ),
          ),
        ],
      ),
    );
  }

  void _saveEmployeeInformation() {
    setState(() {
      widget.employee.name = nameController.text;
      widget.employee.jobTitle = jobTitleController.text;
      widget.employee.salary = salaryController.text;
      widget.employee.phone = phoneController.text;
      // Additional logic for saving registration date if necessary
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Employee data saved')),
    );
  }
}
