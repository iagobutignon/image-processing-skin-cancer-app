import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../../../shared/colors/app_colors.dart';

class ProcessingImage extends StatelessWidget {
  final String label;
  final Uint8List image;

  const ProcessingImage({
    super.key,
    required this.label,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.memory(
            image,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(175),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(18)),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: const Color(AppColors.black).withAlpha(200),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
