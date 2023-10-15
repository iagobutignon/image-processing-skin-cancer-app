import 'dart:typed_data';

import 'package:flutter_modular/flutter_modular.dart';

class HomeRoutes {
  static const home = '/';
  static const camera = '/camera/';
  static const editImage = '/edit_image/';

  static Future<dynamic> pushCamera() async {
    return await Modular.to.pushNamed(
      camera,
    );
  }

  static Future<dynamic> pushEditImage(Uint8List picture) async {
    return await Modular.to.pushNamed(
      editImage,
      arguments: picture
    );
  }

  static Future<dynamic> pop([dynamic args]) async {
    Modular.to.pop(args);
  }
}
