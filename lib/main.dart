import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/shared_widgets/custom_bottom_navigation.dart';
import 'package:roqqu_task/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Roqqu Task',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primaryColor,
              scrolledUnderElevation: 0.0,
              surfaceTintColor: Colors.transparent,
            ),
            scaffoldBackgroundColor: AppColors.primaryColor,
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
            primarySwatch: Colors.blue,
          ),
          home: const CustomButtomNavigation(),
        );
      },
    );
  }
}
