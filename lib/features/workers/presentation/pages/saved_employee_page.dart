import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/employees_info_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class SavedEmployeePage extends StatelessWidget {
  final String tittle;
  final String btnTittle;
  final Function() onTap;

  const SavedEmployeePage({
    super.key,
    required this.tittle,
    required this.btnTittle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 240,
            right: 100,
            child: Image.asset(
              'assets/images/saved_person.png',
              height: 142.h,
              width: 215.w,
            ),
          ),
          Positioned(
            bottom: 300,
            right: 165,
            child: Text(
              tittle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            bottom: 265,
            right: 110,
            child: SizedBox(
              child: Text(
                'Параметры успешно сохранены.',
                maxLines: 2,
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            right: 90,
            child: CustomTextButton(
              onPressed: onTap,
              text: btnTittle,
              height: 62.h,
              width: 218.w,
            ),
          ),
        ],
      ),
    );
  }
}
