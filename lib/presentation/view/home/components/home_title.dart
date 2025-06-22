import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopy/core/utils/responsive.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 30, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Beauty,\nComfort & More',
            style: GoogleFonts.playfairDisplay(
              fontSize: Responsive.scaledFontSize(context, 30), //30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          CircleAvatar(
            backgroundColor: Colors.deepPurple,
            radius: Responsive.scaledFontSize(context, 18),
            child: Icon(
              Icons.person_2,
              color: Colors.white,
              size: Responsive.scaledFontSize(context, 22),
            ),
          ),
        ],
      ),
    );
  }
}
