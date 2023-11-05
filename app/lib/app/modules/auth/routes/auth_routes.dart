import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_routes.dart';

class AuthRoutes extends AppRoutes {
  static const signIn = '/';
  static const signUp = '/sign_up/';
  static const forgotPassword = '/forgot_password/';

  Future<dynamic> pushSignUp() async {
    return await Modular.to.pushNamed(
      '$authModule$signUp'.removeDoubleSlash(),
    );
  }

  Future<dynamic> pushForgotPassword() async {
    return await Modular.to.pushNamed(
      '$authModule$forgotPassword'.removeDoubleSlash(),
    );
  }

  Future<dynamic> pop([dynamic args]) async {
    Modular.to.pop(args);
  }
}