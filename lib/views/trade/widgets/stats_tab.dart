import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class StatsTab extends StatefulWidget {
  const StatsTab({super.key});

  @override
  State<StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<StatsTab> {
  final List<Map<String, dynamic>> stats = [
    {'name': 'Average ROI', 'value': '+33.73%', 'color': Colors.green},
    {'name': 'Win rates', 'value': '100%', 'color': Colors.white},
    {'name': 'Total profit', 'value': '61850.63 USDT', 'color': Colors.white},
    {'name': 'Average losses', 'value': '0 USDT', 'color': Colors.red},
    {'name': 'Total trades', 'value': '72', 'color': Colors.white},
  ];

  final List<String> tradingPairs = [
    "BTCUSDT",
    "ETHUSDT",
    "XRPUSDT",
    "DOGEUSDT",
    "TIAUSDT",
    "PERPUSDT",
    "DOGEUSDT",
    "TIAUSDT",
    "PERPUSDT",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            color: AppColors.bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Trading statistics',
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
                SizedBox(height: 15.h),
                Column(
                  children: List.generate(stats.length, (index) {
                    final stat = stats[index];
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/icons/bitcoin.png'),
                                  SizedBox(width: 20.w),
                                  Text(stat['name'],
                                      style: AppTextStyles.tinyText),
                                ],
                              ),
                              Text(
                                stat['value'],
                                style: TextStyle(
                                  color: stat['color'],
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (index != stats.length - 1)
                          Divider(
                            thickness: 1.5.h,
                            color: AppColors.borderColor,
                            height: 10.h,
                          )
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            color: AppColors.bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Trading statistics', style: AppTextStyles.tinyWhiteText),
                SizedBox(height: 15.h),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: tradingPairs.map((pair) {
                    return Chip(
                      label: Text(
                        pair,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.containerColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
