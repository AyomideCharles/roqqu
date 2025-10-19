import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/utils/app_text_styles.dart';

class DashboardMytradesTab extends StatefulWidget {
  const DashboardMytradesTab({super.key});

  @override
  State<DashboardMytradesTab> createState() => _DashboardMytradesTabState();
}

class _DashboardMytradesTabState extends State<DashboardMytradesTab> {
  List names = [
    'Jaykay Kayode',
    'Okobi Laura',
    'Tosin Lasisi',
  ];

  List<Color> avatarColors = [
    const Color(0xFF5283FF),
    const Color(0xFFF79009),
    const Color(0xFF85D1F0),
  ];

  String getInitials(String name) {
    List<String> nameParts = name.trim().split(' ');
    if (nameParts.length >= 2) {
      return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
    } else if (nameParts.length == 1 && nameParts[0].isNotEmpty) {
      return nameParts[0][0].toUpperCase();
    }
    return '';
  }

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
                  hintText: 'Search for PRO traders',
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
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String initials = getInitials(names[index]);
                  Color avatarColor = avatarColors[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 32.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: avatarColor.withOpacity(0.14),
                                  border: Border.all(
                                    color: avatarColor,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    initials,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   width: 32.w,
                              //   height: 32.h,
                              //   decoration: BoxDecoration(
                              //       shape: BoxShape.circle,
                              //       border: Border.all(color: Colors.red)),
                              // ),
                              SizedBox(
                                width: 15.h,
                              ),
                              Text(
                                names[index],
                                style: AppTextStyles.regularText,
                              )
                            ],
                          ),
                          Image.asset('assets/images/pro_trader.png')
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total volume',
                                style: AppTextStyles.regularText,
                              ),
                              Text(
                                '996.28 USDT',
                                style: AppTextStyles.regularHeading,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Trading profit',
                                style: AppTextStyles.regularText,
                              ),
                              Text(
                                '278.81 USDT',
                                style: AppTextStyles.regularHeading,
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        height: 40,
                        thickness: 1.5,
                        color: AppColors.primaryColor,
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
