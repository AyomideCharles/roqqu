import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/shared_widgets/chart.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class DashboardChartTab extends StatefulWidget {
  const DashboardChartTab({super.key});

  @override
  State<DashboardChartTab> createState() => _DashboardChartTabState();
}

class _DashboardChartTabState extends State<DashboardChartTab> {
  final List<Map<String, dynamic>> chartTrades = [
    {
      'name': 'PRO trader',
      'value': 'BTC master',
      'isPro': true,
    },
    {'name': 'Entry price', 'value': '1.9661 USDT'},
    {'name': 'Exit price', 'value': '1.9728 USDT'},
    {'name': 'PRO trader amount', 'value': '1.9728 USDT'},
    {'name': 'Entry time', 'value': '01:22 PM'},
    {'name': 'Exit time', 'value': '01:22 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.r),
              color: AppColors.bgColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Copy trading PNL',
                          style: AppTextStyles.tinyWhiteText),
                      SizedBox(width: 8.w),
                      Container(
                        width: 84.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' 7 days',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  const CustomChart()
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              padding: EdgeInsets.all(16.r),
              color: AppColors.bgColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Trading History',
                          style: AppTextStyles.tinyWhiteText),
                      SizedBox(width: 8.w),
                      Container(
                        width: 84.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' 7 days',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      color: AppColors.containerColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icons/bitcoin.png'),
                              SizedBox(width: 10.w),
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: AppColors.greyColor,
                                  ),
                                  children: const [
                                    TextSpan(text: 'BTCUSDT - '),
                                    TextSpan(
                                      text: '10X',
                                      style: TextStyle(
                                        color: AppColors.blueColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '+3.28% ROI',
                            style: TextStyle(color: AppColors.greenColor),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.borderColor,
                      child: Column(
                        children: chartTrades.map((trade) {
                          bool isPro = trade['isPro'] == true;

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  trade['name'],
                                  style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                isPro
                                    ? Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/avatar.png'),
                                          SizedBox(width: 8.w),
                                          Text(
                                            trade['value'],
                                            style: TextStyle(
                                              color: AppColors.blueColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        trade['value'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
