

import 'package:flutter/material.dart';

class CameraIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final AlignmentGeometry alignment;

  const CameraIcon({
    super.key,
    required this.icon,
    this.onPressed,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: CircleAvatar(
          backgroundColor: Colors.black54,
          foregroundColor: Colors.white,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
          ),
        ),
      ),
    );
  }
}