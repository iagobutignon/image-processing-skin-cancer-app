import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfoDialog {
  static Future<bool> show({
    String? title,
    required String message,
  }) async {

    final context = Modular.routerDelegate.navigatorKey.currentContext;

    if (context == null) {
      return false;
    }

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            OutlinedButton(
              onPressed: () => Modular.to.pop(true),
              child: const Text('Confirmar'),
            ),
            OutlinedButton(
              onPressed: () => Modular.to.pop(false),
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}