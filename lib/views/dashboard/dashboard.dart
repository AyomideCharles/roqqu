import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/shared_widgets/custom_app_bar.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/views/dashboard/widgets/dashboard_chart_tab.dart';
import 'package:roqqu_task/views/dashboard/widgets/dashboard_current_trades_tab.dart';
import 'package:roqqu_task/views/dashboard/widgets/dashboard_mytrades_tab.dart';
import 'package:roqqu_task/views/dashboard/widgets/dashboard_pnl.dart';
import 'package:roqqu_task/views/dashboard/widgets/dashboard_stats_tab.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
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
      appBar: const CustomAppBar(title: 'My dashboard'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const DashboardPnl(),
            SizedBox(height: 15.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r)),
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
                  Tab(text: 'Current trades'),
                  Tab(text: 'Stats'),
                  Tab(text: 'My traders'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  DashboardChartTab(),
                  DashboardCurrentTradesTab(),
                  DashboardStatsTab(),
                  DashboardMytradesTab()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
