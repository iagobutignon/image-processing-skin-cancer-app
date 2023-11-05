import 'package:flutter_modular/flutter_modular.dart';

import 'di/shared_di.dart';

class SharedModule extends Module {
  @override
  List<Bind> get binds => [
    ...SharedDI.binds,
  ];
}