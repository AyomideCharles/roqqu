// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:roqqu_task/views/widgets/quick_action_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFC0CFFE),
          Color(0xFFF3DFF4),
          Color(0xFFF9D8E5),
        ],
        stops: [0.0, 0.7, 1.0],
      )),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Crypto'),
                  Row(
                    children: [
                      Image.asset('assets/icons/search.png'),
                      SizedBox(width: 15.w),
                      Image.asset('assets/icons/headphones.png'),
                      SizedBox(width: 15.w),
                      Image.asset('assets/icons/notification.png'),
                      SizedBox(width: 15.w),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your GBP Balance',
                            style: TextStyle(
                                color: AppColors.greyColor, fontSize: 12.sp),
                          ),
                          SizedBox(width: 5.w),
                          Icon(Iconsax.eye,
                              size: 15.sp, color: AppColors.greyColor)
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.encodeSans(
                              fontWeight: FontWeight.w800,
                              fontSize: 32.sp,
                              color: Colors.white,
                            ),
                            children: [
                              const TextSpan(text: '£0'),
                              TextSpan(
                                text: '.00',
                                style: GoogleFonts.encodeSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const QuickActionCard(),
                      SizedBox(height: 25.h),
                      Container(
                        width: double.infinity,
                        height: 112.h,
                        decoration: BoxDecoration(
                            color: AppColors.bgColor,
                            borderRadius: BorderRadius.circular(16.r),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFABE2F3),
                                Color(0xFFBDE4E5),
                                Color(0xFFEBE9D0),
                              ],
                              stops: [0.0, 0.5, 1.0],
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Copy Trading',
                                    style: GoogleFonts.encodeSans(
                                      color: AppColors.primaryColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    'Discover our latest feature. Follow and watch\n the PRO traders closely and win like a PRO!\n We are rooting for you!',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Image.asset('assets/images/crown.png')
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        'Stay updated',
                        style: AppTextStyles.heading,
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Listed Coins',
                            style: AppTextStyles.heading,
                          ),
                          Text(
                            'See all',
                            style: GoogleFonts.encodeSans(
                              color: AppColors.blueColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
