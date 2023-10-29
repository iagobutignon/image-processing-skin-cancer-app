import 'package:flutter/material.dart';

import 'check_text.dart';

class PasswordCheckPanel extends StatelessWidget {

  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  const PasswordCheckPanel({
    super.key,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        marginLeft,
        marginTop,
        marginRight,
        marginBottom,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckText(
            label: 'Mínimo de 8 caracteres',
            checked: true,
          ),
          CheckText(
            label: 'Pelo menos um número',
            checked: true,
          ),
          CheckText(
            label: 'Pelo menos uma letra minúscula',
            checked: true,
          ),
          CheckText(
            label: 'Pelo menos uma letra maiúscula',
            checked: false,
          ),
          CheckText(
            label: 'Pelo menos um símbolo (!@#\$%&*)',
            checked: true,
          ),
          CheckText(
            label: 'Confirmação de senha válida',
            checked: false,
          ),
        ],
      ),
    );
  }
}
