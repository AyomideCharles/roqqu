import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 108.w,
              height: 32.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyColor),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Crypto',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  )
                ],
              )),
          Row(
            children: [
              Image.asset('assets/icons/search.png'),
              SizedBox(width: 15.w),
              Image.asset('assets/icons/headphones.png'),
              SizedBox(width: 15.w),
              Image.asset('assets/icons/notification.png'),
              SizedBox(width: 15.w),
              Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                      color: const Color(0xFF7676801F).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/uk.png'),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
