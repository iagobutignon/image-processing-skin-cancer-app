import 'package:flutter/widgets.dart';

import '../../../../../../core/colors/app_colors.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(AppColors.black),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
