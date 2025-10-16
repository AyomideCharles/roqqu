import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class QuickActionCard extends StatefulWidget {
  const QuickActionCard({super.key});

  @override
  State<QuickActionCard> createState() => _QuickActionCardState();
}

class _QuickActionCardState extends State<QuickActionCard> {
  bool expanded = false;
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
          height: expanded ? 180.h : 80.h,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(),
                    CircleAvatar(),
                    CircleAvatar(),
                    CircleAvatar(),
                  ],
                ),
                if (expanded) ...[
                  SizedBox(height: 20.h),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(),
                      CircleAvatar(),
                      CircleAvatar(),
                      CircleAvatar(),
                    ],
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
}
