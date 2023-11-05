import 'package:flutter_modular/flutter_modular.dart';

import '../pages/splash_page.dart';
import '../routes/start_routes.dart';
import '../stores/splash_store.dart';

class StartDI {
  static List<Bind> get binds => [
    Bind.lazySingleton((i) => SplashStore()),
  ];

  static List<ModularRoute> get routes => [
    ChildRoute(StartRoutes.splash, child: (context, args) => const SplashPage()),
  ];
}