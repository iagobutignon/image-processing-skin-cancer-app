import 'package:flutter/material.dart';

import '../../../../../../shared/colors/app_colors.dart';

class EmailField extends StatelessWidget {
  final String label;
  final Widget leadingIcon;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final bool withBorder;

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
    this.withBorder = true,
  });

  Color get colorSelector =>
      MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? const Color(AppColors.green) : const Color(AppColors.grey));

  OutlineInputBorder? get greyBorder => !withBorder 
    ? OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(AppColors.grey), width: 0))
    : OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(AppColors.grey), width: 2));

  OutlineInputBorder? get greenBorder => !withBorder 
    ? OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(AppColors.grey), width: 0)) 
    : OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(AppColors.green), width: 2));

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
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(
            color: Color(AppColors.grey),
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: leadingIcon,
          filled: true,
          fillColor: const Color(AppColors.white),
          prefixIconColor: colorSelector,
          suffixIconColor: colorSelector,
          border: greenBorder,
          enabledBorder: greyBorder,
          focusedBorder: greenBorder,
        ),
      ),
    );
  }
}
