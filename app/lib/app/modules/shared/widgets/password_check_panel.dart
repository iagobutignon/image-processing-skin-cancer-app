import 'package:flutter/material.dart';

import '../../../../../../core/colors/app_colors.dart';
import 'check_text.dart';

class PasswordCheckPanel extends StatelessWidget {
  final bool hasMinChars;
  final bool hasOneNumber;
  final bool hasOneLowerLetter;
  final bool hasOneUpperLetter;
  final bool hasOneSymbol;
  final bool isValid;

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
    this.hasMinChars = false,
    this.hasOneNumber = false,
    this.hasOneLowerLetter = false,
    this.hasOneUpperLetter = false,
    this.hasOneSymbol = false,
    this.isValid = false,
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
          color: const Color(AppColors.grey),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckText(
            label: 'Mínimo de 8 caracteres',
            checked: hasMinChars,
          ),
          CheckText(
            label: 'Pelo menos um número',
            checked: hasOneNumber,
          ),
          CheckText(
            label: 'Pelo menos uma letra minúscula',
            checked: hasOneLowerLetter,
          ),
          CheckText(
            label: 'Pelo menos uma letra maiúscula',
            checked: hasOneUpperLetter,
          ),
          CheckText(
            label: 'Pelo menos um símbolo (!@#\$%&*)',
            checked: hasOneSymbol,
          ),
          CheckText(
            label: 'Confirmação de senha válida',
            checked: isValid,
          ),
        ],
      ),
    );
  }
}
