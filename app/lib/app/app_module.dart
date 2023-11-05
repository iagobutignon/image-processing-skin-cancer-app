import 'package:flutter_modular/flutter_modular.dart';

import 'app_di.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    ...AppDI.imports,
  ];

  @override
  final List<Bind> binds = [
    ...AppDI.binds,
  ];

  @override
  final List<ModularRoute> routes = [
    ...AppDI.routes,
  ];

}