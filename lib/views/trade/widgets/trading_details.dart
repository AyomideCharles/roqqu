import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/views/trade/widgets/all_trades_tab.dart';
import 'package:roqqu_task/views/trade/widgets/chart_tab.dart';
import 'package:roqqu_task/views/trade/widgets/copier_tab.dart';
import 'package:roqqu_task/views/trade/widgets/stats_tab.dart';

class TradingDetails extends StatefulWidget {
  const TradingDetails({super.key});

  @override
  State<TradingDetails> createState() => _TradingDetailsState();
}

class _TradingDetailsState extends State<TradingDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Trading details'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          ListTile(
            leading: Stack(
              children: [
                Container(
                  width: 51.w,
                  height: 51.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                    bottom: -5,
                    right: 0,
                    child: Image.asset('assets/icons/group.png')),
              ],
            ),
            title: Text(
              'BTC master',
              style: GoogleFonts.encodeSans(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            subtitle: Row(
              children: [
                Icon(Iconsax.people, size: 12.sp, color: AppColors.blueColor),
                SizedBox(width: 5.w),
                Text('500 Copiers',
                    style: GoogleFonts.encodeSans(
                        color: AppColors.blueColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: 110.w,
                height: 32.h,
                decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: BorderRadius.circular(6.r)),
                child: Text('43 trading days',
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
              ),
              Container(
                alignment: Alignment.center,
                width: 110.w,
                height: 32.h,
                decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: BorderRadius.circular(6.r)),
                child: Text('15% profit-share',
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
              ),
              Container(
                alignment: Alignment.center,
                width: 110.w,
                height: 32.h,
                decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: BorderRadius.circular(6.r)),
                child: Text('56 total orders',
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Container(
            padding: EdgeInsets.all(6.r),
            // height: 88.h,
            decoration: BoxDecoration(
                color: AppColors.bgColor,
                border: Border.all(color: AppColors.borderColor, width: 1.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/icons/group4.png'),
                    SizedBox(width: 10.w),
                    Image.asset('assets/icons/group5.png')
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  'Certified PROtrader',
                  style: GoogleFonts.encodeSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/chart.png'),
                          const Text('High win rate',
                              style: TextStyle(color: Colors.green))
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF79009).withOpacity(0.08),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/Vector.png'),
                          const Text('Great risk control',
                              style: TextStyle(color: Color(0xFFF79009)))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              border: Border.all(color: AppColors.borderColor, width: 1.5),
            ),
            child: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.blueColor,
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.greyColor,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Chart'),
                Tab(text: 'Stats'),
                Tab(text: 'All Trades'),
                Tab(text: 'Copiers'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ChartTab(),
                StatsTab(),
                AllTradesTab(),
                CopierTab()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
