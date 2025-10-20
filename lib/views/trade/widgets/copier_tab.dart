import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/models/pro_tarder_model.dart';
import 'package:roqqu_task/shared_widgets/trader_tile.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class CopierTab extends StatelessWidget {
  const CopierTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                  hintText: 'Search for copiers',
                  hintStyle: TextStyle(color: AppColors.greyColor),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: AppColors.containerColor),
            ),
            SizedBox(
              height: 30.h,
            ),
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: dummyTraders.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final trader = dummyTraders[index];
                  return TraderTile(
                    trader: trader,
                    showImage: false,
                  );
                })
          ],
        ),
      ),
    );
  }
}
