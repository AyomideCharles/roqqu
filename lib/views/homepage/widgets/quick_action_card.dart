import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class QuickActionCard extends StatefulWidget {
  const QuickActionCard({super.key});

  @override
  State<QuickActionCard> createState() => _QuickActionCardState();
}

class _QuickActionCardState extends State<QuickActionCard> {
  bool expanded = false;
  final List<Map<String, dynamic>> topActions = [
    {'icon': 'assets/icons/deposit.png', 'label': 'Deposit'},
    {'icon': 'assets/icons/buy.png', 'label': 'Buy'},
    {'icon': 'assets/icons/withdraw.png', 'label': 'Withdraw'},
    {'icon': 'assets/icons/sell.png', 'label': 'Sell'},
  ];

  final List<Map<String, dynamic>> bottomActions = [
    {'icon': 'assets/icons/deposit.png', 'label': 'Send'},
    {'icon': 'assets/icons/buy.png', 'label': 'Receive'},
    {'icon': 'assets/icons/withdraw.png', 'label': 'Swap'},
    {'icon': 'assets/icons/sell.png', 'label': 'Transfer'},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            border: Border.all(color: const Color(0xFF262932)),
            borderRadius: BorderRadius.circular(16.r),
          ),
          height: expanded ? 240.h : 120.h,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: topActions.map((e) {
                    return actionButton(context, e['icon'], e['label']);
                  }).toList(),
                ),
                if (expanded) ...[
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: bottomActions.map((e) {
                      return actionButton(context, e['icon'], e['label']);
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() => expanded = !expanded);
          },
          child: Container(
            width: 77.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              border: Border.all(color: const Color(0xFF262932)),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Center(
              child: Text(
                expanded ? "See less" : "See more",
                style: TextStyle(
                  color: AppColors.blueColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget actionButton(BuildContext context, String icon, String text) {
    return Column(
      children: [
        Image.asset(icon),
        SizedBox(
          height: 8.h,
        ),
        Text(
          text,
          style: AppTextStyles.tinyText,
        )
      ],
    );
  }
}
