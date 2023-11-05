import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/colors/app_colors.dart';

class InfoSnackbar {
  static void show(
    String message, {
    Color? backgroundColor,
    Color? foregroundColor,
  }) async {
    final context = Modular.routerDelegate.navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor ?? const Color(AppColors.green),
        action: SnackBarAction(
          onPressed: () {},
          label: 'OK',
          textColor: foregroundColor ?? const Color(AppColors.white),
        ),
      ),
    );
  }
}
