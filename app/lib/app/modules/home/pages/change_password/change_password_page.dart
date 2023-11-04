import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/themes/app_theme.dart';
import '../../stores/change_password_store.dart';
import '../sign_up/widgets/password_check_panel.dart';
import '../widgets/large_button.dart';
import '../widgets/password_field.dart';

class ChangePasswordPage extends StatefulWidget {
  final String title;
  
  const ChangePasswordPage({
    super.key,
    this.title = 'Alterar senha',
  });

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late final ChangePasswordStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<ChangePasswordStore>();
  }

  @override
  void dispose() {
    Modular.dispose<ChangePasswordStore>();
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
            PasswordField(              
              label: 'Senha atual',
              controller: TextEditingController(),
              marginTop: 5,
            ),
            const PasswordCheckPanel(
              marginTop: 15,
            ),
            PasswordField(
              label: 'Confirmar nova senha',
              controller: TextEditingController(),
              marginTop: 15,
            ),
            PasswordField(
              label: 'Confirmar nova senha',
              controller: TextEditingController(),
              marginTop: 15,
            ),
            const Spacer(),
            LargeButton(
              label: 'Alterar senha',
              onPressed: () {},
              marginTop: 40,
            ),
          ],
        ),
      ),
    );
  }
}