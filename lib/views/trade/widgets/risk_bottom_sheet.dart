import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:roqqu_task/views/trade/widgets/enter_amount_page.dart';

class RiskBottomSheet extends StatefulWidget {
  const RiskBottomSheet({super.key});

  @override
  State<RiskBottomSheet> createState() => _RiskBottomSheetState();
}

class _RiskBottomSheetState extends State<RiskBottomSheet> {
  late List<bool> isExpandedList;
  final List<Map<String, String>> risks = [
    {
      'title': 'Market risks',
      'description':
          'All investments carry risks, including potential loss of capital.'
    },
    {
      'title': 'Dependency on others',
      'description':
          'All investments carry risks, including potential loss of capital.'
    },
    {
      'title': 'Mismatched risk profiles',
      'description':
          'All investments carry risks, including potential loss of capital.'
    },
    {
      'title': 'Control and understanding',
      'description':
          'All investments carry risks, including potential loss of capital.'
    },
    {
      'title': 'Emotional decisions',
      'description':
          'All investments carry risks, including potential loss of capital.'
    },
    {
      'title': 'Costs involved',
      'description':
          'All investments carry risks, including potential loss of capital.'
    },
    {
      'title': 'Diversify',
      'description':
          'All investments carry risks, including potential loss of capital.'
    },
    {
      'title': 'Execution risks',
      'description':
          'All investments carry risks, including potential loss of capital.'
    },
  ];

  @override
  void initState() {
    super.initState();
    // Initialize expansion states to false for all items
    isExpandedList = List.generate(risks.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 20.h),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
              alignment: AlignmentGeometry.centerRight,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/icons/close.png'))),
          SizedBox(
            height: 15.h,
          ),
          Text('Risks involved in copy trading',
              style: AppTextStyles.bigHeader),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Please make sure you read the following risks involved in copy trading before making a decision.',
            textAlign: TextAlign.center,
            style: AppTextStyles.regularText,
          ),
          SizedBox(
            height: 25.h,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: risks.length,
              itemBuilder: (context, index) {
                final item = risks[index];
                final isExpanded = isExpandedList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpandedList[index] = !isExpanded;
                    });
                  },
                  child: Container(
                    width: isExpanded ? 220 : 120,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(12),
                      // border: Border.all(color: Colors.white12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        if (isExpanded)
                          Text(item['description']!,
                              style: AppTextStyles.regularText),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomButton(
              text: 'I have read the risks',
              onPressed: () {
                Get.to(() => const EnterAmountPage());
              })
        ],
      ),
    );
  }
}
