import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../pages/widgets/error_snackbar.dart';
import '../routes/home_routes.dart';
import '../services/interfaces/iauth_service.dart';

class SignInStore extends Store<int> {
  final IAuthService _authService;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  SignInStore(this._authService) : super(0);

  Future<void> signIn() async {
    try {
      await _authService.signIn(
        email: emailController.text,
        password: passwordController.text,
      );

      HomeRoutes.navigateHome();
    } on Exception catch (e) {
      ErrorSnackbar.show(e.toString());
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _authService.signInWithGoogle();

      HomeRoutes.navigateHome();
    } on Exception catch (e) {
      ErrorSnackbar.show(e.toString());
    }
  }

  Future<void> pushSignUp() async {
    await HomeRoutes.pushSignUp();
  }

  Future<void> pushForgotPassword() async {
    await HomeRoutes.pushForgotPassword();
  }

  @override
  void initStore() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initStore();
  }

  @override
  Future destroy() {
    emailController.dispose();
    passwordController.dispose();

    return super.destroy();
  }
}
