import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class ListedCoins extends StatelessWidget {
  const ListedCoins({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.bgColor,
            border: Border.all(color: AppColors.borderColor)),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            primary: false,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/bitcoin.png'),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bitcoin',
                                  style: AppTextStyles.regularHeading,
                                ),
                                Text(
                                  'BTC',
                                  style: AppTextStyles.tinyText,
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Bitcoin',
                              style: AppTextStyles.regularHeading,
                            ),
                            Text(
                              'BTC',
                              style: AppTextStyles.tinyText,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                    color: AppColors.borderColor,
                  )
                ],
              );
            }));
  }
}
