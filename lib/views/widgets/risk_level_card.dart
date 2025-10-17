import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';

class RiskLevelCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const RiskLevelCard({
    super.key,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 108.h,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.blueColor : AppColors.borderColor,
            width: 1.5,
          ),
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.encodeSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              description,
              style: GoogleFonts.encodeSans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
