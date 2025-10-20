import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/shared_widgets/chart.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/support.dart';
import 'package:roqqu_task/views/trade/widgets/importand_message_sheet.dart';
import '../../../utils/app_text_styles.dart';

class ChartTab extends StatelessWidget {
  const ChartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.r),
              color: AppColors.bgColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ROI', style: AppTextStyles.tinyWhiteText),
                      SizedBox(width: 8.w),
                      Container(
                        width: 84.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' 7 days',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomChart()
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.all(16.r),
              color: AppColors.bgColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ROI', style: AppTextStyles.tinyWhiteText),
                      SizedBox(width: 8.w),
                      Container(
                        width: 84.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' 7 days',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomChart()
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.all(16.r),
              color: AppColors.bgColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Assets allocation',
                          style: AppTextStyles.tinyWhiteText),
                      SizedBox(width: 8.w),
                      Container(
                        width: 84.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' 7 days',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomPieChart()
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.all(16.r),
              color: AppColors.bgColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Holding period',
                          style: AppTextStyles.tinyWhiteText),
                      SizedBox(width: 8.w),
                      Container(
                        width: 84.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: AppColors.containerColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' 7 days',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.bgColor,
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
            text: 'Copy trade',
            onPressed: () {
              Support.showCustomBottomSheet(
                  context, (p0) => const ImportandMessageSheet());
            }),
      ),
    );
  }
}
