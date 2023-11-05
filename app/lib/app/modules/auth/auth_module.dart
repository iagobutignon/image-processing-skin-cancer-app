import 'package:flutter_modular/flutter_modular.dart';

import 'di/auth_di.dart';
 
class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    ...AuthDI.binds,
  ];

  @override
  final List<ModularRoute> routes = [
    ...AuthDI.routes,
  ];
}