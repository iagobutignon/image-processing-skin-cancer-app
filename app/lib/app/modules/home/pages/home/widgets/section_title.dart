import 'package:flutter/widgets.dart';

import '../../../../../../core/colors/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(AppColors.black),
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
