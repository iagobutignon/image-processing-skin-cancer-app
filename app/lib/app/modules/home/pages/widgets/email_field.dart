import 'package:flutter/material.dart';

import '../../../../../../shared/colors/app_colors.dart';

class EmailField extends StatelessWidget {
  final String label;
  final Widget leadingIcon;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  final TextEditingController controller;

  const EmailField({
    super.key,
    required this.controller,
    this.label = 'Email',
    this.leadingIcon = const Icon(Icons.email),
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
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(
            color: Color(AppColors.grey),
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: leadingIcon,
          filled: true,
          fillColor: const Color(AppColors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
