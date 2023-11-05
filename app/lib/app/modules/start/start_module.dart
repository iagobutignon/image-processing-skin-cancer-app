import 'package:flutter_modular/flutter_modular.dart';

import 'di/start_di.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    ...StartDI.binds,
  ];

  @override
  final List<ModularRoute> routes = [
    ...StartDI.routes,
  ];
}