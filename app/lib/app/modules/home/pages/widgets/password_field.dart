import 'package:flutter/material.dart';

import '../../../../../../shared/colors/app_colors.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final Widget leadingIcon;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final bool withBorder;

  final TextEditingController controller;

  const PasswordField({
    super.key,
    required this.controller,
    this.label = 'Senha',
    this.leadingIcon = const Icon(Icons.lock),
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.withBorder = true,
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

  Color get colorSelector =>
      MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? const Color(AppColors.green) : const Color(AppColors.grey));

  OutlineInputBorder? get greyBorder => !widget.withBorder 
    ? OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(AppColors.grey), width: 0))
    : OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(AppColors.grey), width: 2));

  OutlineInputBorder? get greenBorder => !widget.withBorder 
    ? OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(AppColors.grey), width: 0)) 
    : OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(AppColors.green), width: 2));

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
        keyboardType: TextInputType.visiblePassword,
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
