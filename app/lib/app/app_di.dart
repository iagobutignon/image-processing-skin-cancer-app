import 'package:flutter_modular/flutter_modular.dart';

import '../core/data/interfaces/iuser_repository.dart';
import '../core/data/user_repository.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/shared/shared_module.dart';
import 'modules/start/start_module.dart';
import 'app_routes.dart';

class AppDI {
  static List<Module> get imports => [
    SharedModule(),
  ];

  static List<Bind> get binds => [
    Bind.singleton<IUserRepository>((i) => UserRepository()),
  ];

  static List<ModularRoute> get routes => [
    ModuleRoute(AppRoutes().startModule, module: StartModule()),
    ModuleRoute(AppRoutes().authModule, module: AuthModule()),
    ModuleRoute(AppRoutes().homeModule, module: HomeModule()),
  ];
}