import 'dart:typed_data';

import 'package:flutter_modular/flutter_modular.dart';

class HomeRoutes {
  static const signIn = '/';
  static const signUp = '/sign_up/';
  static const home = '/home';
  static const camera = '/camera/';
  static const editImage = '/edit_image/';

  static Future<dynamic> pushSignUp() async {
    return await Modular.to.pushNamed(
      signUp,
    );
  }

  static Future<Uint8List?> pushCamera() async {
    return await Modular.to.pushNamed(
      camera,
    );
  }

  static Future<Uint8List?> pushEditImage(Uint8List picture) async {
    return await Modular.to.pushNamed(
      editImage,
      arguments: picture,
    );
  }

  static Future<dynamic> pop([dynamic args]) async {
    Modular.to.pop(args);
  }
}
