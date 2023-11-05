import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../shared/extensions/password_extension.dart';
import '../../shared/services/interfaces/iauth_service.dart';
import '../../shared/widgets/error_snackbar.dart';
import '../../shared/widgets/info_snackbar.dart';
import '../states/sign_up_state.dart';

class SignUpStore extends Store<SignUpState> {
  final IAuthService _authService;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  SignUpStore(this._authService) : super(SignUpState());

  Future<void> createAccout() async {
    try {
      if (!state.isValidEmail) {
        ErrorSnackbar.show('Email inválido');
        return;
      }

      if (!state.isValidPassword) {
        ErrorSnackbar.show('Senha inválida');
        return;
      }

      if (!state.passwordMatchConfirmPassword) {
        ErrorSnackbar.show('As senhas não coincidem');
        return;
      }

      final email = emailController.text;
      final password = passwordController.text;

      await _authService.signUp(
        email: email,
        password: password,
      );

      InfoSnackbar.show('Conta criada com sucesso!');
      
    } catch (e) {
      ErrorSnackbar.show('Não foi possível criar sua conta.');
    }
  }

  Future<void> validate() async {
    final aux = state;

    aux.isValidEmail = emailController.text.isValidEmail();
    aux.hasMinChars = passwordController.text.hasMinChars();
    aux.hasOneNumber = passwordController.text.hasOneNumber();
    aux.hasOneLowerLetter = passwordController.text.hasOneLowerLetter();
    aux.hasOneUpperLetter = passwordController.text.hasOneUpperLetter();
    aux.hasOneSymbol = passwordController.text.hasOneSymbol();
    aux.passwordMatchConfirmPassword = passwordController.text == confirmPasswordController.text;

    await execute(() async => aux);
  }

  @override
  void initStore() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    emailController.addListener(validate);
    passwordController.addListener(validate);
    confirmPasswordController.addListener(validate);

    super.initStore();
  }

  @override
  Future destroy() {
    emailController.removeListener(validate);
    passwordController.removeListener(validate);
    confirmPasswordController.removeListener(validate);

    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    return super.destroy();
  }
}
