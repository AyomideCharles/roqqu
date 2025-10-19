import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:roqqu_task/views/dashboard/dashboard.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/images/layer.png',
            width: 102.w,
            height: 92.h,
            fit: BoxFit.fill,
          )),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Trade copied successfully',
            style: AppTextStyles.keyPadText,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'You have successfully copied BTC\n Master’s trade.',
            textAlign: TextAlign.center,
            style: AppTextStyles.regularText,
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.bgColor,
        child: CustomButton(
            text: 'Go to dashboard',
            onPressed: () {
              Get.to(() => const Dashboard());
            }),
      ),
    );
  }
}
