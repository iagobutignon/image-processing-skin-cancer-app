import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_theme.dart';
import '../widgets/email_field.dart';
import '../widgets/large_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String title;
  
  const ForgotPasswordPage({
    super.key,
    this.title = 'ForgotPasswordPage',
  });

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {


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
            const Spacer(),
            LargeButton(
              label: 'Enviar Email',
              onPressed: () {},
              marginTop: 40,
            ),
          ],
        ),
      ),
    );
  }
}
