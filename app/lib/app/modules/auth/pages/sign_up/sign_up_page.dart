import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/themes/app_theme.dart';
import '../../../shared/widgets/email_field.dart';
import '../../../shared/widgets/large_button.dart';
import '../../../shared/widgets/password_check_panel.dart';
import '../../../shared/widgets/password_field.dart';
import '../../states/sign_up_state.dart';
import '../../stores/sign_up_store.dart';

class SignUpPage extends StatefulWidget {
  final String title;

  const SignUpPage({
    super.key,
    this.title = 'Nova conta',
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<SignUpStore>();
  }

  @override
  void dispose() {
    Modular.dispose<SignUpStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppTheme.mainColor,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  EmailField(
                    controller: store.emailController,
                    marginTop: 5,
                  ),
                  TripleBuilder<SignUpStore, SignUpState>(
                      store: store,
                      builder: (context, triple) {
                        return PasswordCheckPanel(
                          marginTop: 15,
                          hasMinChars: triple.state.hasMinChars,
                          hasOneNumber: triple.state.hasOneNumber,
                          hasOneLowerLetter: triple.state.hasOneLowerLetter,
                          hasOneUpperLetter: triple.state.hasOneUpperLetter,
                          hasOneSymbol: triple.state.hasOneSymbol,
                          isValid: triple.state.isValidPassword,
                        );
                      }),
                  PasswordField(
                    controller: store.passwordController,
                    marginTop: 15,
                  ),
                  PasswordField(
                    label: 'Confirmar Senha',
                    controller: store.confirmPasswordController,
                    marginTop: 15,
                  ),
                  const Spacer(),
                  LargeButton(
                    label: 'Criar Conta',
                    onPressed: store.createAccout,
                    marginTop: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
