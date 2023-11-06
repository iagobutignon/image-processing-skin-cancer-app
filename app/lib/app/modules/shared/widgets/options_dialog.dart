import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/colors/app_colors.dart';

class OptionsDialog {
  static Future<dynamic> show({
    String? title,
    required String message,
    required List<String> options,
  }) async {
    final context = Modular.routerDelegate.navigatorKey.currentContext;

    if (context == null) {
      return false;
    }

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: title != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
            children: [
              if (title != null)
                Text(title),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Modular.to.pop(),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            ...options.asMap().entries.map(
                  (e) => DialogButton(
                    label: e.value,
                    index: e.key,
                  ),
                ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
        );
      },
    );
  }
}

class DialogButton extends StatelessWidget {
  final String label;
  final int index;

  const DialogButton({
    super.key,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Modular.to.pop(index),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(AppColors.green),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          const Color(AppColors.white),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: Text(label),
    );
  }
}
