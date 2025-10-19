import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StayUpdated extends StatefulWidget {
  const StayUpdated({super.key});

  @override
  State<StayUpdated> createState() => _StayUpdatedState();
}

class _StayUpdatedState extends State<StayUpdated> {
  final List<Map<String, dynamic>> updates = [
    {
      'title': 'Delisting coins',
      'subtitle': 'View the list of coins we are delisting',
      'notice': true,
      'icon': 'assets/icons/notif.png'
    },
    {
      'title': 'Exchange Rates',
      'subtitle': 'View all currencies rate at a glance',
      'icon': 'assets/icons/exchange.png'
    },
    {
      'title': 'Roqqu Expands to Europe',
      'subtitle': 'We are now on the shores of Europe!.',
      'icon': 'assets/icons/exchange.png'
    },
  ];

  final PageController _pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 74.h,
          child: PageView.builder(
            controller: _pageController,
            padEnds: false,
            scrollDirection: Axis.horizontal,
            itemCount: updates.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final update = updates[index];
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.w),
                    padding: const EdgeInsets.all(16),
                    // width: 312.w,
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: Row(
                      children: [
                        Image.asset(update['icon']),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(update['title'],
                                style: AppTextStyles.regularHeading),
                            Text(update['subtitle'],
                                style: AppTextStyles.tinyText),
                          ],
                        )
                      ],
                    ),
                  ),
                  if (update['notice'] == true)
                    Positioned(
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.r),
                                topRight: Radius.circular(8.r)),
                            color: const Color(0xFFFF554A).withOpacity(0.08)),
                        width: 100.w,
                        height: 24.h,
                        child: const Center(
                          child: Text(
                            'Urgent Notice',
                            style: TextStyle(color: Color(0xFFF04438)),
                          ),
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: updates.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.white,
            dotColor: Colors.grey,
            dotHeight: 6,
            dotWidth: 6,
            expansionFactor: 3,
          ),
        ),
      ],
    );
  }
}
