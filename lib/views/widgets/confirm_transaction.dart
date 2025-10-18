import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class ConfirmTransaction extends StatelessWidget {
  const ConfirmTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Confirm transaction'),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderColor)),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/US.png',
                  width: 56.w,
                  height: 56.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Copy trading amount',
                  style: AppTextStyles.tinyText,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '100 USD',
                  style: AppTextStyles.header,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PRO trader',
                      style: AppTextStyles.tinyText,
                    ),
                    Text(
                      'BTC master',
                      style: AppTextStyles.whiteTinyText,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What you get',
                      style: AppTextStyles.tinyText,
                    ),
                    Text(
                      '99 USD',
                      style: AppTextStyles.whiteTinyText,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction fee',
                      style: AppTextStyles.tinyText,
                    ),
                    Text(
                      '1.00 USD',
                      style: AppTextStyles.whiteTinyText,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        // height: 7.h,
        color: AppColors.bgColor,
        child: CustomButton(text: 'Confirm  transaction', onPressed: () {}),
      ),
    );
  }
}
