import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../extensions/password_extension.dart';
import '../pages/widgets/error_snackbar.dart';
import '../pages/widgets/info_snackbar.dart';
import '../services/interfaces/iauth_service.dart';
import '../states/change_password_state.dart';

class ChangePasswordStore extends Store<ChangePasswordState> {
  final IAuthService _authService;

  late final TextEditingController currentPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmNewPasswordController;

  ChangePasswordStore(this._authService) : super(ChangePasswordState());

  Future<void> changePassword() async {
    try {
      if (!state.isValidPassword) {
        ErrorSnackbar.show('Senha inválida');
        return;
      }

      if (!state.passwordMatchConfirmPassword) {
        ErrorSnackbar.show('As senhas não coincidem');
        return;
      }

      final currentPassword = currentPasswordController.text;
      final newPassword = newPasswordController.text;

      await _authService.changePassword(
        email: 'email',
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      InfoSnackbar.show('Conta criada com sucesso!');
      
    } catch (e) {
      ErrorSnackbar.show('Não foi possível criar sua conta.');
    }
  }

  Future<void> validate() async {
    final aux = state;

    aux.hasMinChars = newPasswordController.text.hasMinChars();
    aux.hasOneNumber = newPasswordController.text.hasOneNumber();
    aux.hasOneLowerLetter = newPasswordController.text.hasOneLowerLetter();
    aux.hasOneUpperLetter = newPasswordController.text.hasOneUpperLetter();
    aux.hasOneSymbol = newPasswordController.text.hasOneSymbol();
    aux.passwordMatchConfirmPassword = newPasswordController.text == confirmNewPasswordController.text;

    await execute(() async => aux);
  }

  @override
  void initStore() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();

    currentPasswordController.addListener(validate);
    newPasswordController.addListener(validate);
    confirmNewPasswordController.addListener(validate);

    super.initStore();
  }

  @override
  Future destroy() {
    currentPasswordController.removeListener(validate);
    newPasswordController.removeListener(validate);
    confirmNewPasswordController.removeListener(validate);

    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();

    return super.destroy();
  }
}