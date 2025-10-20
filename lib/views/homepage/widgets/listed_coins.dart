import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/controller/binance_controller.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class ListedCoins extends StatelessWidget {
  const ListedCoins({super.key});

  @override
  Widget build(BuildContext context) {
    final BinanceController controller = Get.put(BinanceController());

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.bgColor,
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Obx(() {
        if (controller.isLoading.value || controller.coins.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(32.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  SizedBox(height: 16.h),
                  Text(
                    controller.isConnected.value
                        ? 'Loading market data...'
                        : 'Connecting to Binance...',
                    style: AppTextStyles.tinyText,
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.coins.length,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final coin = controller.coins[index];
            final isPositive = coin.isPositive;

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              coin.iconPath,
                              width: 32.w,
                              height: 32.w,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 32.w,
                                  height: 32.w,
                                  decoration: const BoxDecoration(
                                    color: AppColors.borderColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.currency_bitcoin,
                                    size: 20.sp,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    coin.name,
                                    style: AppTextStyles.regularHeading,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    coin.symbol.toUpperCase(),
                                    style: AppTextStyles.tinyText,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Right: Price and change
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            coin.formattedPrice,
                            style: AppTextStyles.regularHeading,
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: isPositive
                                  ? Colors.green.withOpacity(0.15)
                                  : Colors.red.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              coin.formattedChange,
                              style: AppTextStyles.tinyText.copyWith(
                                color: isPositive ? Colors.green : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Divider
                if (index < controller.coins.length - 1)
                  Divider(
                    thickness: 1,
                    color: AppColors.borderColor,
                    height: 1,
                    indent: 16.w,
                    endIndent: 16.w,
                  ),
              ],
            );
          },
        );
      }),
    );
  }
}
