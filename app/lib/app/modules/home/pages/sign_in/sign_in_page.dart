import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_iago/shared/colors/app_colors.dart';

import '../../../../../shared/themes/app_theme.dart';
import '../../stores/sign_in_store.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/large_button.dart';
import 'widgets/text_link.dart';

class SignInPage extends StatefulWidget {
  final String title;

  const SignInPage({
    super.key,
    this.title = 'SignInPage',
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
              EmailField(
                controller: TextEditingController(),
                label: 'Email',
                leadingIcon: const Icon(Icons.email),
                marginBottom: 15,
              ),
              PasswordField(
                label: 'Senha',
                leadingIcon: const Icon(Icons.lock),
                controller: TextEditingController(),
              ),
              const TextLink(
                text: 'Esqueceu sua senha? Clique Aqui!',
                marginTop: 15,
              ),
              LargeButton(
                label: 'Entrar',
                onPressed: () {},
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
                preffixIcon: const Icon(Icons.mail),
                onPressed: () {},
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