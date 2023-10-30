import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/themes/app_theme.dart';
import '../../stores/sign_up_store.dart';
import '../widgets/email_field.dart';
import '../widgets/large_button.dart';
import 'widgets/password_check_panel.dart';
import '../widgets/password_field.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            EmailField(
              controller: TextEditingController(),
              marginTop: 5,
            ),
            const PasswordCheckPanel(
              marginTop: 15,
            ),
            PasswordField(
              controller: TextEditingController(),
              marginTop: 15,
            ),
            PasswordField(
              label: 'Confirmar Senha',
              controller: TextEditingController(),
              marginTop: 15,
            ),
            const Spacer(),
            LargeButton(
              label: 'Criar Conta',
              onPressed: () {},
              marginTop: 40,
            ),
          ],
        ),
      ),
    );
  }
}
