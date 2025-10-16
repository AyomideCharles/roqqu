import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_task/utils/app_colors.dart';
import 'package:roqqu_task/views/history.dart';
import 'package:roqqu_task/views/homepage.dart';
import 'package:roqqu_task/views/profile.dart';
import 'package:roqqu_task/views/trade/trade.dart';
import 'package:roqqu_task/views/wallet.dart';

class CustomButtomNavigation extends StatefulWidget {
  const CustomButtomNavigation({super.key});

  @override
  State<CustomButtomNavigation> createState() => _CustomButtomNavigationState();
}

class _CustomButtomNavigationState extends State<CustomButtomNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    Homepage(),
    Wallet(),
    Trade(),
    History(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: const BoxDecoration(
          color: AppColors.bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('assets/icons/home.png', 'Home', 0),
            _buildNavItem('assets/icons/wallet.png', 'Wallet', 1),
            _buildCenterButton(),
            _buildNavItem('assets/icons/history.png', 'History', 3),
            _buildNavItem('assets/icons/profile.png', 'Profile', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = 2;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildNavItem(String image, String label, int index) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                image,
                width: 25.w,
                height: 25.h,
                color: isSelected ? Colors.white : Colors.grey,
              ),
              if (isSelected)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    height: 6,
                    width: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF79009),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
