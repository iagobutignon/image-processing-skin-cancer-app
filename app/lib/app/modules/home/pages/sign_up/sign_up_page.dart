import 'package:flutter/material.dart';
import 'package:tcc_iago/app/modules/home/pages/widgets/large_button.dart';
import 'package:tcc_iago/shared/themes/app_theme.dart';

import '../widgets/check_text.dart';
import '../widgets/email_field.dart';
import '../widgets/password_check_panel.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppTheme.mainColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            EmailField(
              controller: TextEditingController(),
              label: 'Email',
              leadingIcon: const Icon(Icons.email),
              marginTop: 5,
            ),
            const PasswordCheckPanel(
              marginTop: 15,
            ),
            PasswordField(
              label: 'Senha',
              leadingIcon: const Icon(Icons.lock),
              controller: TextEditingController(),
              marginTop: 15,
            ),
            PasswordField(
              label: 'Confirmar Senha',
              leadingIcon: const Icon(Icons.lock),
              controller: TextEditingController(),
              marginTop: 15,
            ),
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
