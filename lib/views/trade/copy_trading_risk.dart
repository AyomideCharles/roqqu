import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class CopyTradingRisk extends StatefulWidget {
  const CopyTradingRisk({super.key});

  @override
  State<CopyTradingRisk> createState() => _CopyTradingRiskState();
}

class _CopyTradingRiskState extends State<CopyTradingRisk> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Copy Trading'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What risk level are you\n comfortable exploring?',
                style: AppTextStyles.header),
            SizedBox(
              height: 10.h,
            ),
            Text('Choose a level', style: AppTextStyles.tinyText),
            SizedBox(
              height: 30.h,
            ),
            RiskLevelCard(
                title: 'Conservative profile',
                description:
                    'Conservative profile involves stable returns from proven strategies with minimal volatility.',
                isSelected: selectedIndex == 0,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                }),
            SizedBox(
              height: 20.h,
            ),
            RiskLevelCard(
                title: 'Steady growth profile',
                description:
                    'Steady growth involves balanced gains with moderate fluctuations in strategy performance.',
                isSelected: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                }),
            SizedBox(
              height: 20.h,
            ),
            RiskLevelCard(
                title: 'Exponential growth profile',
                description:
                    'It has potentials for significant gains or losses due to aggressive trading and market exposure.',
                isSelected: selectedIndex == 2,
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class RiskLevelCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const RiskLevelCard({
    super.key,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 108.h,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.blueColor : AppColors.borderColor,
            width: 1.5,
          ),
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.encodeSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              description,
              style: GoogleFonts.encodeSans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
