import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Function() onPressed;
  final Icon? icon;

  const CustomTextButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
      ),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff2253F6),
              Color(0xff9DB4FF),
            ],
          ),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonTextFieldForm extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final TextEditingController controller;
  const CommonTextFieldForm({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      maxLines: maxLines,
    );
  }
}
