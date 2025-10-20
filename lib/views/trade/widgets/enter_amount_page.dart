import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:roqqu_task/views/trade/widgets/confirm_transaction.dart';

class EnterAmountPage extends StatefulWidget {
  const EnterAmountPage({super.key});

  @override
  State<EnterAmountPage> createState() => _EnterAmountPageState();
}

class _EnterAmountPageState extends State<EnterAmountPage> {
  final TextEditingController _controller =
      TextEditingController(text: '0 USD');
  String getAmountValue() {
    String text = _controller.text.replaceAll('USD', '').trim();
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Enter amount',
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.w),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(color: AppColors.containerColor)),
            child: Row(
              children: [
                Image.asset('assets/images/US.png'),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  'USD',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            TextField(
              keyboardType: TextInputType.number,
              controller: _controller,
              // enabled: false,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '0 USD',
                // hintStyle: TextStyle(
                //   color: Colors.white.withOpacity(0.3),
                //   fontSize: 36.sp,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              // width: 208.w,
              // height: 20.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.bgColor,
                  border: Border.all(color: AppColors.borderColor)),
              child: Text(
                'Transaction fee (1%) - 1.00 USD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.bgColor,
                  border: Border.all(color: AppColors.borderColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('USD Balance', style: AppTextStyles.tinyText),
                      Text(
                        '\$240.73',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.r),
                        color: AppColors.containerColor,
                        border: Border.all(color: AppColors.borderColor)),
                    child: Text(
                      'Use Max',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 25.h),
            CustomButton(
                text: 'Continue',
                onPressed: () {
                  String amount = getAmountValue();
                  Get.to(() => ConfirmTransaction(
                        amount: amount,
                      ));
                })
          ],
        ),
      ),
    );
  }
}
