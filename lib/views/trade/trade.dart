import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/views/trade/copy_trading.dart';

class Trade extends StatelessWidget {
  const Trade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Get.to(() => const CopyTrading());
              },
              child: const Text('Trade'))),
    );
  }
}
