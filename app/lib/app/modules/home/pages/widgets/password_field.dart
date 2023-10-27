import 'package:flutter/material.dart';

import '../../../../../../shared/colors/app_colors.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final Widget leadingIcon;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  final TextEditingController controller;

  const PasswordField({
    super.key,
    required this.label,
    required this.leadingIcon,
    required this.controller,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool isHiding;

  @override
  void initState() {
    isHiding = true;
    super.initState();
  }

  void hide() => setState(() => isHiding = !isHiding);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        widget.marginLeft,
        widget.marginTop,
        widget.marginRight,
        widget.marginBottom,
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: isHiding,
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: const TextStyle(
            color: Color(AppColors.grey),
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: widget.leadingIcon,
          suffixIcon: IconButton(
            onPressed: hide,
            icon: Icon(isHiding ? Icons.visibility_off : Icons.visibility),
          ),
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
