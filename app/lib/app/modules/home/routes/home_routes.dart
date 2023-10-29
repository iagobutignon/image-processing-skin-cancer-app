import 'dart:typed_data';

import 'package:flutter_modular/flutter_modular.dart';

class HomeRoutes {
  static const signIn = '/';
  static const signUp = '/sign_up/';
  static const forgotPassword = '/forgot_password/';
  static const home = '/home';
  static const camera = '/camera/';
  static const editImage = '/edit_image/';
  static const processing = '/processing/';
  static const analysis = '/analysis/';

  static void navigateHome() {
    Modular.to.navigate(
      home,
    );
  }

  static Future<dynamic> pushSignUp() async {
    return await Modular.to.pushNamed(
      signUp,
    );
  }

  static Future<dynamic> pushForgotPassword() async {
    return await Modular.to.pushNamed(
      forgotPassword,
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

  static Future<void> pushProcessing(Uint8List picture) async {
    await Modular.to.pushNamed(processing, arguments: picture);
  }

  static Future<void> pushAnalysis() async {
    await Modular.to.pushNamed(
      analysis,
    );
  }

  static Future<dynamic> pop([dynamic args]) async {
    Modular.to.pop(args);
  }
}
