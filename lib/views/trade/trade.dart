import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Trade extends StatelessWidget {
  const Trade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFC0CFFE),
          Color(0xFFF3DFF4),
          Color(0xFFF9D8E5),
        ],
        stops: [0.0, 0.7, 1.0],
      )),
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Crypto'),
                Row(
                  children: [
                    Image.asset('assets/icons/search.png'),
                    SizedBox(width: 15.w),
                    Image.asset('assets/icons/headphones.png'),
                    SizedBox(width: 15.w),
                    Image.asset('assets/icons/notification.png'),
                    SizedBox(width: 15.w),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    ));
  }
}





// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart'; // optional

// class Trade extends StatelessWidget {
//   const Trade({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true, // allows content behind bottom nav
//       backgroundColor: const Color(0xFF0E0E10),
//       bottomNavigationBar: _buildBottomNav(),
//       body: Stack(
//         children: [
//           // Gradient background
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xFFDCCBFF),
//                   Color(0xFF121212),
//                 ],
//               ),
//             ),
//           ),

//           // Main content scroll
//           SingleChildScrollView(
//             padding: const EdgeInsets.only(top: 80),
//             child: Column(
//               children: [
//                 _buildTopSelector(),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),

//           // Blurry bottom sheet overlay
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(24),
//                 topRight: Radius.circular(24),
//               ),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.05),
//                     border: Border.all(
//                       color: Colors.white.withOpacity(0.1),
//                     ),
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(24),
//                       topRight: Radius.circular(24),
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       _buildSection("Trade", [
//                         "Deposit",
//                         "Buy",
//                         "Withdraw",
//                         "Sell",
//                         "Swap",
//                         "Send",
//                         "Receive",
//                         "Transfer",
//                       ]),
//                       const SizedBox(height: 20),
//                       _buildSection("Earn", ["Airdrops", "Savings"]),
//                       const SizedBox(height: 20),
//                       const Text(
//                         "Games",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSection(String title, List<String> items) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.grey,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 12),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.05),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.white.withOpacity(0.1)),
//           ),
//           child: Column(
//             children: items
//                 .map(
//                   (e) => ListTile(
//                     dense: true,
//                     leading: const Icon(Iconsax.arrow_circle_down,
//                         color: Colors.blueAccent),
//                     title: Text(
//                       e,
//                       style: const TextStyle(color: Colors.white, fontSize: 14),
//                     ),
//                     trailing:
//                         const Icon(Icons.chevron_right, color: Colors.grey),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTopSelector() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.15),
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: const Row(
//               children: [
//                 Text(
//                   "Crypto",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w500),
//                 ),
//                 Icon(Icons.keyboard_arrow_down, color: Colors.white),
//               ],
//             ),
//           ),
//           const Row(
//             children: [
//               Icon(Icons.search, color: Colors.white),
//               SizedBox(width: 16),
//               Icon(Icons.headphones, color: Colors.white),
//               SizedBox(width: 16),
//               Icon(Icons.notifications_none, color: Colors.white),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomNav() {
//     return BottomAppBar(
//       color: Colors.black.withOpacity(0.8),
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8,
//       child: SizedBox(
//         height: 70,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: const [
//             _NavItem(icon: Iconsax.home, label: "Home", active: true),
//             _NavItem(icon: Iconsax.wallet_2, label: "Wallet"),
//             SizedBox(width: 40),
//             _NavItem(icon: Iconsax.clock, label: "History"),
//             _NavItem(icon: Iconsax.user, label: "Profile"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _NavItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final bool active;

//   const _NavItem(
//       {required this.icon, required this.label, this.active = false});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(icon, color: active ? Colors.white : Colors.grey),
//         Text(
//           label,
//           style: TextStyle(
//             color: active ? Colors.white : Colors.grey,
//             fontSize: 12,
//           ),
//         ),
//       ],
//     );
//   }
// }
