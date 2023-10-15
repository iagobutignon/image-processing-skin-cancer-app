import 'package:flutter_modular/flutter_modular.dart';

import 'di/home_di.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    ...HomeDI.binds,
  ];

  @override
  final List<ModularRoute> routes = [
    ...HomeDI.routes,
  ];
}