import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: Responsive.scaledFontSize(context, 22),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
