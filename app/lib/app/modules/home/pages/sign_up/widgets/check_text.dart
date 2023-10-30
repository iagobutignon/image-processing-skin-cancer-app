import 'package:flutter/material.dart';
import 'package:tcc_iago/shared/colors/app_colors.dart';

class CheckText extends StatelessWidget {
  final String label;
  final bool checked;
  
  const CheckText({
    super.key,
    required this.label,
    this.checked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          checked ? Icons.check : Icons.close,
          color: checked ? Colors.green : Colors.red,
        ),
        Text(
          label,
          style: TextStyle(
            color: const Color(AppColors.grey),
            fontWeight: checked ? FontWeight.bold : FontWeight.normal,
            fontStyle: checked ? FontStyle.normal : FontStyle.italic,
          ),
        ),
      ],
    );
  }
}