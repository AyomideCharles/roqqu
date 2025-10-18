import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class Trade extends StatefulWidget {
  const Trade({super.key});

  @override
  State<Trade> createState() => _TradeState();
}

class _TradeState extends State<Trade> {
  final List<String> tradeOptions = [
    'Buy',
    'Sell',
    'Swap',
    'Send',
    'Receive',
    'Invest'
  ];

  final List<String> earnOptions = [
    'Roqq n roll',
    'Savings',
    'Savings',
    'Mission',
    'Copy trading',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.transparent),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 45.h),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text('Crypto'),
                  //     Row(
                  //       children: [
                  //         Image.asset('assets/icons/search.png'),
                  //         SizedBox(width: 15.w),
                  //         Image.asset('assets/icons/headphones.png'),
                  //         SizedBox(width: 15.w),
                  //         Image.asset('assets/icons/notification.png'),
                  //         SizedBox(width: 15.w),
                  //       ],
                  //     )
                  //   ],
                  // ),
                ),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.8),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16.w,
                        left: 16.w,
                        top: -55.h,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 24.h),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(24.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Trade',
                                  style: AppTextStyles.heading,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Container(
                                  padding: EdgeInsets.all(16.r),
                                  decoration: BoxDecoration(
                                    color: AppColors.bgColor,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Column(
                                    children: List.generate(tradeOptions.length,
                                        (index) {
                                      final option = tradeOptions[index];
                                      return Column(
                                        children: [
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: Image.asset(
                                                'assets/icons/trade.png'),
                                            title: Text(
                                              option,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                            trailing: const Icon(
                                                Icons.navigate_next,
                                                color: Colors.white),
                                          ),
                                          if (index != tradeOptions.length - 1)
                                            Divider(
                                              thickness: 1.h,
                                              color: AppColors.borderColor,
                                              height: 8.h,
                                            ),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                  'Earn',
                                  style: AppTextStyles.heading,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Container(
                                  padding: EdgeInsets.all(16.r),
                                  decoration: BoxDecoration(
                                    color: AppColors.bgColor,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Column(
                                    children: List.generate(earnOptions.length,
                                        (index) {
                                      final option = earnOptions[index];
                                      return Column(
                                        children: [
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: Image.asset(
                                                'assets/icons/trade.png'),
                                            title: Text(
                                              option,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                            trailing: const Icon(
                                                Icons.navigate_next,
                                                color: Colors.white),
                                          ),
                                          if (index != earnOptions.length - 1)
                                            Divider(
                                              thickness: 1.h,
                                              color: AppColors.borderColor,
                                              height: 8.h,
                                            ),
                                        ],
                                      );
                                    }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
