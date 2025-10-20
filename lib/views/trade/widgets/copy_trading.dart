import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:roqqu_task/views/trade/widgets/copy_trading_risk.dart';

class CopyTrading extends StatefulWidget {
  const CopyTrading({super.key});

  @override
  State<CopyTrading> createState() => _CopyTradingState();
}

class _CopyTradingState extends State<CopyTrading> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<CopyTradingData> _pages = [
    const CopyTradingData(
      title: "Copy PRO traders",
      subtitle:
          "Leverage expert strategies from professional traders to boost your trading results.",
      image: 'assets/images/copy.png',
    ),
    const CopyTradingData(
      title: "Do less, Win more",
      subtitle:
          "Streamline your approach to trading and increase your winning potential effortlessly.",
      image: 'assets/images/less.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.to(() => const CopyTradingRisk());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Copy Trading',
        onPressed: () {
          if (_currentPage > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _pages.length,
                (dotIndex) => Container(
                  width: _currentPage == dotIndex ? 175.w : 175.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: _currentPage == dotIndex
                        ? AppColors.blueColor
                        : AppColors.greyColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: PageView.builder(
                  itemCount: _pages.length,
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(page.title, style: AppTextStyles.header),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(page.subtitle, style: AppTextStyles.tinyText),
                        SizedBox(
                          height: 40.h,
                        ),
                        Center(
                          child: Image.asset(
                            page.image,
                            width: 290.w,
                            height: 290.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: Text('Watch a how to video',
                              style: TextStyle(
                                  color: AppColors.blueColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.bgColor,
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
            text: _currentPage == _pages.length - 1 ? "Get Started" : "Next",
            onPressed: () {
              // Get.to(() => const DoLess());
              _nextPage();
            }),
      ),
    );
  }
}

class CopyTradingData {
  final String title;
  final String subtitle;
  final String image;

  const CopyTradingData({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}
