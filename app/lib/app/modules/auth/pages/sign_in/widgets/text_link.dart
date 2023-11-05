import 'package:flutter/material.dart';

import '../../../../../../core/colors/app_colors.dart';

class TextLink extends StatelessWidget {
  final String text;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  final void Function()? onTap;

  const TextLink({
    super.key,
    required this.text,
    this.onTap,
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
      child: GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(AppColors.white),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
