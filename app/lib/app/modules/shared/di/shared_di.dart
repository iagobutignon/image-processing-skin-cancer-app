import 'package:flutter_modular/flutter_modular.dart';

import '../services/auth_service.dart';
import '../services/interfaces/iauth_service.dart';

class SharedDI {
  static List<Bind> get binds => [
    Bind.lazySingleton<IAuthService>((i) => AuthService(), export: true),
  ];
}