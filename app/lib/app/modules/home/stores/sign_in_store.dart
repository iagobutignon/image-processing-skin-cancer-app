import 'package:flutter_triple/flutter_triple.dart';

import '../routes/home_routes.dart';

class SignInStore extends Store<int> {
  SignInStore() : super(0);

  void navigateHome() {
    HomeRoutes.navigateHome();
  }

  Future<void> pushSignUp() async {
    await HomeRoutes.pushSignUp();
  }

  Future<void> pushForgotPassword() async {
    await HomeRoutes.pushForgotPassword();
  }
}