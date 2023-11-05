import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../shared/services/interfaces/iauth_service.dart';
import '../../shared/widgets/error_snackbar.dart';
import '../routes/auth_routes.dart';

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

      AuthRoutes().navigateAuth();
    } on Exception catch (e) {
      ErrorSnackbar.show(e.toString());
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _authService.signInWithGoogle();

      AuthRoutes().navigateHome();
    } on Exception catch (e) {
      ErrorSnackbar.show(e.toString());
    }
  }

  Future<void> pushSignUp() async {
    await AuthRoutes().pushSignUp();
  }

  Future<void> pushForgotPassword() async {
    await AuthRoutes().pushForgotPassword();
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
