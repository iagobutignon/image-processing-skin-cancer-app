import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_iago/core/colors/app_colors.dart';

import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/assets/app_images.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../../shared/widgets/email_field.dart';
import '../../../shared/widgets/large_button.dart';
import '../../../shared/widgets/password_field.dart';
import '../../stores/sign_in_store.dart';
import 'widgets/text_link.dart';

class SignInPage extends StatefulWidget {
  final String title;

  const SignInPage({
    super.key,
    this.title = 'Login',
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final SignInStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<SignInStore>();
  }

  @override
  void dispose() {
    Modular.dispose<SignInStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.mainColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Image.asset(AppImages.logo),
              ),
              EmailField(
                controller: store.emailController,
                withBorder: false,
                marginBottom: 15,
              ),
              PasswordField(
                controller: store.passwordController,
                withBorder: false,
              ),
              TextLink(
                text: 'Esqueceu sua senha? Clique Aqui!',
                marginTop: 15,
                onTap: store.pushForgotPassword,
              ),
              LargeButton(
                label: 'Entrar',
                onPressed: store.signIn,
                backgroundColor: const Color(AppColors.white),
                foregroundColor: const Color(AppColors.green),
                marginTop: 30,
              ),
              TextLink(
                text: 'Não tem uma conta? Clique Aqui!',
                onTap: store.pushSignUp,
                marginTop: 15,
              ),
              LargeButton(
                label: 'Entrar com a conta Google',
                preffixIcon: Image.asset(
                  AppIcons.google48px,
                  scale: 1.8,
                ),
                onPressed: store.signInWithGoogle,
                backgroundColor: const Color(AppColors.white),
                foregroundColor: const Color(AppColors.green),
                marginTop: 60,
                marginBottom: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
