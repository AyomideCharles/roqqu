import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class DashboardCurrentTradesTab extends StatefulWidget {
  const DashboardCurrentTradesTab({super.key});

  @override
  State<DashboardCurrentTradesTab> createState() =>
      _DashboardCurrentTradesTabState();
}

class _DashboardCurrentTradesTabState extends State<DashboardCurrentTradesTab> {
  final List<Map<String, dynamic>> currentTrades = [
    {
      'name': 'PRO trader',
      'value': 'BTC master',
      'isPro': true,
    },
    {'name': 'Entry price', 'value': '1.9661 USDT'},
    {'name': 'Market price', 'value': '1.9728 USDT'},
    {'name': 'Entry time', 'value': '01:22 PM'},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                children: currentTrades.map((trade) {
                  bool isPro = trade['isPro'] == true;

                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                                  Image.asset('assets/images/avatar.png'),
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
    );
  }
}
