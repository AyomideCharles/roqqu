import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:roqqu_task/views/trade/widgets/success_page.dart';

class ConfirmTransactionPin extends StatefulWidget {
  const ConfirmTransactionPin({super.key});

  @override
  State<ConfirmTransactionPin> createState() => _ConfirmTransactionPinState();
}

class _ConfirmTransactionPinState extends State<ConfirmTransactionPin> {
  String pin = '';
  final int pinLength = 6;

  void onNumberTap(String number) {
    if (pin.length < pinLength) {
      setState(() {
        pin += number;
      });

      if (pin.length == pinLength) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Get.to(() => const SuccessPage());
        });
      }
    }
  }

  void onDeleteTap() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Image.asset('assets/images/PinLock.png')),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Confirm Transaction',
              style: AppTextStyles.header,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Input your 6 digit transaction PIN to confirm your transaction and authenticate your request',
              textAlign: TextAlign.center,
              style: AppTextStyles.regularText,
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(pinLength, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 12.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index < pin.length
                              ? AppColors.blueColor
                              : Colors.grey.shade700,
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Image.asset('assets/images/biometrics.png')
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            keyPad(context),
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: Text(
                'Forgot PIN?',
                style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget keypadButton(String number) {
    return GestureDetector(
      onTap: () => onNumberTap(number),
      child: Container(
        width: 40.w,
        height: 40.h,
        alignment: Alignment.center,
        child: Text(
          number,
          style: AppTextStyles.keyPadText,
        ),
      ),
    );
  }

  Widget keyPad(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [keypadButton('1'), keypadButton('2'), keypadButton('3')],
          ),
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [keypadButton('4'), keypadButton('5'), keypadButton('6')],
          ),
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [keypadButton('7'), keypadButton('8'), keypadButton('9')],
          ),
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              keypadButton('.'),
              keypadButton('0'),
              GestureDetector(
                onTap: () {
                  onDeleteTap();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
