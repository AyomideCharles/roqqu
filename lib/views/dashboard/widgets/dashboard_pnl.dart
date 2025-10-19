import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class DashboardPnl extends StatelessWidget {
  const DashboardPnl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: AppColors.borderColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Copy trading assets',
            style: AppTextStyles.tinyText,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            '\$5,564.96',
            style: GoogleFonts.encodeSans(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: Colors.white),
          ),
          const Divider(
            color: AppColors.bgColor,
            height: 30,
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Net profit',
                    style: AppTextStyles.tinyText,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '\$5,564.96',
                    style: GoogleFonts.encodeSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: Colors.white),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Today's PNL",
                    style: AppTextStyles.tinyText,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/trending-down.png'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        '207.25',
                        style: GoogleFonts.encodeSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: AppColors.greenColor),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
