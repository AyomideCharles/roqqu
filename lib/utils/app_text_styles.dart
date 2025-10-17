import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class AppTextStyles {
  static final heading = GoogleFonts.encodeSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.greyColor,
  );

  static final header = GoogleFonts.encodeSans(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: const Color(0xFFFFFFFF),
  );

  static final tinyText = TextStyle(
      color: AppColors.greyColor, fontSize: 12.sp, fontWeight: FontWeight.w400);

  static final tinyWhiteText = GoogleFonts.encodeSans(
      color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w700);
}
