import 'package:flutter/widgets.dart';

class PageImage extends StatelessWidget {
  final String asset;

  const PageImage({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(asset);
  }
}
