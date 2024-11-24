import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/employee/presentation/widget/text_buttons.dart';

class CustomSavedPage extends StatelessWidget {
  final String tittle;
  final String btnTittle;
  final Function() onTap;

  const CustomSavedPage({
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/saved_person.png',
              height: 142.h,
              width: 215.w,
            ),
            Text(
              tittle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              child: Text(
                'Параметры успешно сохранены.',
                maxLines: 2,
              ),
            ),
            CustomTextButton(
              onPressed: onTap,
              text: btnTittle,
              height: 62.h,
              width: 218.w,
            ),
          ],
        ),
      ),
    );
  }
}
