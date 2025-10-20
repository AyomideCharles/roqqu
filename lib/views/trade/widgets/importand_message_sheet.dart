import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/shared_widgets/custom_button.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';
import 'package:roqqu_task/utils/support.dart';
import 'package:roqqu_task/views/trade/widgets/risk_bottom_sheet.dart';

class ImportandMessageSheet extends StatefulWidget {
  const ImportandMessageSheet({super.key});

  @override
  State<ImportandMessageSheet> createState() => _ImportandMessageSheetState();
}

class _ImportandMessageSheetState extends State<ImportandMessageSheet> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.asset('assets/images/important.png'),
          SizedBox(
            height: 15.h,
          ),
          Text('Important message!', style: AppTextStyles.bigHeader),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Don’t invest unless you’re prepared and understand the risks involved in copy trading. Learn more about the risks.',
            textAlign: TextAlign.center,
            style: AppTextStyles.regularText,
          ),
          SizedBox(
            height: 15.h,
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: RichText(
              text: TextSpan(
                style: GoogleFonts.encodeSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
                children: [
                  const TextSpan(
                      text: 'Check this box to agree to Roqqu’s copy trading'),
                  TextSpan(
                    text: ' policy',
                    style: GoogleFonts.encodeSans(color: AppColors.blueColor),
                  ),
                ],
              ),
            ),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
            activeColor: Colors.orange,
            checkColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomButton(
              text: 'Proceed to copy trade',
              onPressed: () {
                Navigator.pop(context);
                Support.showCustomBottomSheet(
                    context, (p0) => const RiskBottomSheet());
              })
        ],
      ),
    );
  }
}
