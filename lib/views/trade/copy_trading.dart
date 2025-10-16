import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

import 'do_less.dart';

class CopyTrading extends StatelessWidget {
  const CopyTrading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Copy Trading'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Copy PRO traders', style: AppTextStyles.header),
            SizedBox(
              height: 10.h,
            ),
            Text(
                'Leverage expert strategies from professional traders to boost your trading results.',
                style: AppTextStyles.tinyText),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: Image.asset(
                'assets/images/copy.png',
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
              Get.to(() => const DoLess());
            }),
      ),
    );
  }
}
