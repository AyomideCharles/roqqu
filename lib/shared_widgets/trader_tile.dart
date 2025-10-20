import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/models/pro_tarder_model.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class TraderTile extends StatelessWidget {
  final TraderModel trader;
  final bool showImage;

  const TraderTile({
    super.key,
    required this.trader,
    this.showImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: trader.avatarColor.withOpacity(0.14),
                    border: Border.all(
                      color: trader.avatarColor,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      trader.initials,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.h),
                Text(
                  trader.name,
                  style: AppTextStyles.regularText,
                ),
              ],
            ),
            if (showImage) Image.asset('assets/images/pro_trader.png'),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Total volume',
                  style: AppTextStyles.regularText,
                ),
                Text(
                  '996.28 USDT',
                  style: AppTextStyles.regularHeading,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Trading profit',
                  style: AppTextStyles.regularText,
                ),
                Text(
                  '278.81 USDT',
                  style: AppTextStyles.regularHeading,
                ),
              ],
            ),
          ],
        ),
        const Divider(
          height: 40,
          thickness: 1.5,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
