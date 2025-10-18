import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:roqqu_task/views/trade/copy_trading_dashboard.dart';
import '../widgets/risk_level_card.dart';

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
      bottomNavigationBar: Container(
        color: AppColors.bgColor,
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
            text: 'Proceed',
            onPressed: () {
              Get.to(() => const CopyTradingDashboard());
            }),
      ),
    );
  }
}
