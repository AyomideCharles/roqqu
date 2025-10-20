import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final Function() onPressed;
  final String? fontFamily;
  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.isDisabled = false,
    this.height,
    this.fontSize,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      width: width,
      height: height,
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        child: Opacity(
          opacity: isDisabled ? 0.6 : 1.0,
          child: Container(
            height: 48.h,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF483BEB),
                  Color(0xFF7847E1),
                  Color(0xFFDD568D),
                ],
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: fontFamily,
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
