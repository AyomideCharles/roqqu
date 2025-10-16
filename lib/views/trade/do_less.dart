import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

import '../../utils/app_colors.dart';
import 'copy_trading_risk.dart';

class DoLess extends StatelessWidget {
  const DoLess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Copy Trading',
          style: AppTextStyles.tinyText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Do less, Win more', style: AppTextStyles.header),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Streamline your approach to trading and increase your winning potential effortlessly.',
              style: TextStyle(color: AppColors.greyColor, fontSize: 12.sp),
            ),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: Image.asset(
                'assets/images/less.png',
                width: 290.w,
                height: 290.h,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Center(
              child: Text('Watch a how to video',
                  style: TextStyle(
                      color: AppColors.blueColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
            text: 'Get started',
            onPressed: () {
              Get.to(() => const CopyTradingRisk());
            }),
      ),
    );
  }
}
