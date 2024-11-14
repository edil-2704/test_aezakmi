import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_aezakmi/features/splash_page.dart';
import 'package:test_aezakmi/internal/commons/bottom_navbar.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';
import 'package:test_aezakmi/internal/dependencies/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 860),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.mainBackground,
              ),
              useMaterial3: true,
            ),
            home: SplashPage(),
          );
        });
  }
}
