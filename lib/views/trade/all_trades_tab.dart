import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class AllTradesTab extends StatelessWidget {
  const AllTradesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trading History',
            style: GoogleFonts.encodeSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          SizedBox(height: 10.h),
          Text(
            'History content goes here...',
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
