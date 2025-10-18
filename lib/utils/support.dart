import 'package:flutter/material.dart';
import 'package:roqqu_task/utils/app_colors.dart';

class Support {
  static Future<dynamic> showCustomBottomSheet(
      BuildContext context, Widget Function(BuildContext) builder) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      backgroundColor: AppColors.primaryColor,
      builder: builder,
    );
  }
}
