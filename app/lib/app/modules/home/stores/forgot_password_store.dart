import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../services/interfaces/iauth_service.dart';
import '../states/forgot_password_state.dart';

class ForgotPasswordStore extends Store<ForgotPasswordState> {
  late final TextEditingController emailController;

  final IAuthService _authService;

  ForgotPasswordStore(this._authService) : super(ForgotPasswordState());

  Future<void> sendEmail() async {
    await _authService.resetPassword(
      email: emailController.text,
    );
  }

  @override
  void initStore() {
    emailController = TextEditingController();

    super.initStore();
  }

  @override
  Future destroy() {
    emailController.dispose();

    return super.destroy();
  }
}
