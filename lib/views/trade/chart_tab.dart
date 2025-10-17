import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class ChartTab extends StatelessWidget {
  const ChartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trading Strategy',
            style: GoogleFonts.encodeSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          SizedBox(height: 10.h),
          Text(
            'The trader focuses on Bitcoin and Ethereum, utilizing a mix of day trading and swing trading strategies to capitalize on market volatility.',
            style: GoogleFonts.encodeSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyColor),
          ),
        ],
      ),
    );
  }
}
