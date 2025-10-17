import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:roqqu_task/views/trade/trading_details.dart';

class CopyTradingDashboard extends StatelessWidget {
  const CopyTradingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Copy Trading'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 171.w,
                  height: 118.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF262932),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                Container(
                  width: 171.w,
                  height: 118.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF262932),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text('PRO Traders',
                style: GoogleFonts.encodeSans(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const TradingDetails());
              },
              child: Container(
                width: double.infinity,
                height: 212.h,
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  border: Border.all(color: AppColors.borderColor, width: 1.5),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Stack(
                              children: [
                                Container(
                                  width: 51.w,
                                  height: 51.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                    bottom: -5,
                                    right: 0,
                                    child:
                                        Image.asset('assets/icons/group.png')),
                              ],
                            ),
                            title: Text('Jay isisou',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400)),
                            subtitle: Row(
                              children: [
                                Icon(Iconsax.people,
                                    size: 12.sp, color: AppColors.blueColor),
                                SizedBox(width: 5.w),
                                Text('500',
                                    style: GoogleFonts.encodeSans(
                                        color: AppColors.blueColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            trailing: Container(
                              width: 80.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1.5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              alignment: Alignment.center,
                              child: Text('Copy',
                                  style: TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          const Divider(
                            color: AppColors.borderColor,
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ROI',
                                    style: AppTextStyles.tinyText,
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    '+120.42%',
                                    style: GoogleFonts.encodeSans(
                                        color: Colors.green,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 2.h),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.encodeSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                      ),
                                      children: [
                                        const TextSpan(text: 'Total PNL: '),
                                        TextSpan(
                                          text: '\$38,667.29',
                                          style: GoogleFonts.encodeSans(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset('assets/images/chart.png')
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.r),
                            bottomRight: Radius.circular(16.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.encodeSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                ),
                                children: [
                                  const TextSpan(text: 'Win rate: '),
                                  TextSpan(
                                    text: '100%',
                                    style: GoogleFonts.encodeSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.encodeSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'AUM: ',
                                    style: GoogleFonts.encodeSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '38,667.29',
                                    style: GoogleFonts.encodeSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
