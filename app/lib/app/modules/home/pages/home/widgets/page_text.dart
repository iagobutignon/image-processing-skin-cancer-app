import 'package:flutter/widgets.dart';

class PageText extends StatelessWidget {
  final String text;

  const PageText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
    );
  }
}
