import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/internal/commons/bottom_navbar.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.darkGradient,
              AppColors.firstGradient,
              AppColors.secondGradient,
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/splash.png', // Update to correct path and format
            width: 200.w,
            height: 150.h,
          ),
        ),
      ),
    );
  }
}
