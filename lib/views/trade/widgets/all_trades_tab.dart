import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class AllTradesTab extends StatefulWidget {
  const AllTradesTab({super.key});

  @override
  State<AllTradesTab> createState() => _AllTradesTabState();
}

class _AllTradesTabState extends State<AllTradesTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> currentTrades = [
    {'name': 'Entry price', 'value': '1.9661 USDT'},
    {'name': 'Market price', 'value': '1.9728 USDT'},
    {'name': 'Copier', 'value': '20'},
    {'name': 'Copiers amount', 'value': '1009.772 USDT'},
    {'name': 'Entry time', 'value': '01:22 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6.w),
          decoration: const BoxDecoration(
            color: AppColors.containerColor,
          ),
          child: Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.greyColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Current trades'),
                Tab(text: 'History'),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      color: AppColors.containerColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icons/bitcoin.png'),
                              SizedBox(width: 10.w),
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: AppColors.greyColor,
                                  ),
                                  children: const [
                                    TextSpan(text: 'BTCUSDT - '),
                                    TextSpan(
                                      text: '10X',
                                      style: TextStyle(
                                        color: AppColors.blueColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '+3.28% ROI',
                            style: TextStyle(color: AppColors.greenColor),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.borderColor,
                      child: Column(
                        children: currentTrades.map((trade) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(trade['name'],
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400)),
                                Text(trade['value'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                );
              }),
        )
      ],
    );
  }
}
