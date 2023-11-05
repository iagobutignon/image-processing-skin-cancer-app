import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/themes/app_theme.dart';
import '../../stores/forgot_password_store.dart';
import '../widgets/email_field.dart';
import '../widgets/large_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String title;
  
  const ForgotPasswordPage({
    super.key,
    this.title = 'Esqueci minha senha',
  });

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final ForgotPasswordStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<ForgotPasswordStore>();
  }

  @override
  void dispose() {
    Modular.dispose<ForgotPasswordStore>();
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
              controller: store.emailController,
              marginTop: 5,
            ),
            const Spacer(),
            LargeButton(
              label: 'Enviar Email',
              onPressed: store.sendEmail,
              marginTop: 40,
            ),
          ],
        ),
      ),
    );
  }
}
