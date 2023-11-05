import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes {
  final startModule = '/';
  final authModule = '/auth/';
  final homeModule = '/home/';

  void navigateHome() {
    Modular.to.navigate(homeModule);
  }

  void navigateAuth() {
    Modular.to.navigate(authModule);
  }
}

extension RouteExtension on String {
  String removeDoubleSlash() => replaceAll('//', '/');
} 