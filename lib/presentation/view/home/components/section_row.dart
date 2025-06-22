import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopy/core/utils/responsive.dart';

class SectionRow extends StatelessWidget {
  const SectionRow({
    super.key,
    required this.title,
    required this.prefixText,
    this.onTap,
  });
  final String title;
  final String prefixText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: Responsive.scaledFontSize(context, 24), //24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          GestureDetector(
            onTap: onTap,
            child: Text(
              prefixText,
              style: GoogleFonts.playfairDisplay(
                fontSize: Responsive.scaledFontSize(context, 18), //18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8E44AD),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
