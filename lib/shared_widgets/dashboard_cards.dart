import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final List<Color> gradientColors;
  final VoidCallback? onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.gradientColors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 171.w,
        height: 118.h,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
            stops: const [0.0, 0.5, 1.0],
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(iconPath),
            const Spacer(),
            Text(
              title,
              style: GoogleFonts.encodeSans(
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
                color: AppColors.primaryColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.bgColor,
                  ),
                ),
                const Icon(Icons.navigate_next),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
