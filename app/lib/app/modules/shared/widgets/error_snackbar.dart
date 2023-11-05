import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/colors/app_colors.dart';

class ErrorSnackbar {
  static void show(String error) {
    final context = Modular.routerDelegate.navigatorKey.currentContext;

    if (context == null) {
      return;
    }
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: const Color(AppColors.red),
        action: SnackBarAction(
          label: 'Ok',
          textColor: const Color(AppColors.white),
          onPressed: () {},
        ),
      ),
    );
  }
}
