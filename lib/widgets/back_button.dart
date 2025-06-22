import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/responsive.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, this.backgroundColor = Colors.white});
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      left: 12,
      child: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: CircleAvatar(
          radius: Responsive.scaledFontSize(context, 18),
          backgroundColor: backgroundColor,
          child: Icon(
            Icons.arrow_back_ios_new,
            size: Responsive.scaledFontSize(context, 24),
          ),
        ),
      ),
    );
  }
}
