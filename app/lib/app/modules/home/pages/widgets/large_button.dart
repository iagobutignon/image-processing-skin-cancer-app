import 'package:flutter/material.dart';

import '../../../../../../shared/colors/app_colors.dart';

class LargeButton extends StatelessWidget {
  final String label;
  final Widget? preffixIcon;
  final void Function()? onPressed;

  final Color backgroundColor;
  final Color foregroundColor;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  const LargeButton({
    super.key,
    required this.label,
    this.preffixIcon,
    this.onPressed,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.backgroundColor = const Color(AppColors.green),
    this.foregroundColor = const Color(AppColors.white),
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
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            foregroundColor,
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size.fromHeight(50),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        child: Stack(
          children: [
            if (preffixIcon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: preffixIcon!,
              ),
            Align(
              alignment: Alignment.center,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
