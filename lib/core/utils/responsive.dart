import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    this.largeMobile,
    this.tablet,
  });
  final Widget mobile;
  final Widget? largeMobile;
  final Widget? tablet;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;
  static bool isLargeMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 500 &&
      MediaQuery.of(context).size.width < 700;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 700 &&
      MediaQuery.of(context).size.width < 1080;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1080;

  static double scaledFontSize(BuildContext context, double baseSize) {
    if (isMobile(context)) {
      return baseSize * 1.0; // base scale for mobile
    } else if (isLargeMobile(context)) {
      return baseSize * 1.1; // a bit bigger
    } else if (isTablet(context)) {
      return baseSize * 1.2; // bigger still
    } else if (isDesktop(context)) {
      return baseSize * 1.5; // biggest scale
    } else {
      return baseSize; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 700 && tablet != null) {
      return tablet!;
    } else if (size.width >= 500 && largeMobile != null) {
      return largeMobile!;
    } else {
      return mobile;
    }
  }
}
