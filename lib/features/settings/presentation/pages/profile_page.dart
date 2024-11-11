import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.mainBlue,
              AppColors.mainGreen,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // Действие при нажатии на первую кнопку
                },
                child: const Text('t.profile.aboutCompanyTitle'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Действие при нажатии на вторую кнопку
                },
                child: const Text('profile'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Действие при нажатии на третью кнопку
                },
                child: const Text(''),
              ),
              const SizedBox(height: 20),
              // Positioned можно использовать только внутри Stack.
              const Positioned(
                top: 50.0,
                left: 0.0,
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
