import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/responsive.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    super.key,
    required this.icon,
    required this.titleText,
    required this.descriptionText,
    required this.buttonIcon,
    required this.buttontext,
  });
  final IconData icon;
  final String titleText;
  final String descriptionText;
  final IconData buttonIcon;
  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: Responsive.scaledFontSize(context, 80),
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            titleText,
            style: TextStyle(
              fontSize: Responsive.scaledFontSize(context, 20),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            descriptionText,
            style: TextStyle(
              color: Colors.grey,
              fontSize: Responsive.scaledFontSize(context, 14),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              context.go('/search'); // Go back to home or product list
            },
            icon: Icon(
              buttonIcon,
              size: Responsive.scaledFontSize(context, 18),
            ),
            label: Text(
              buttontext,
              style: TextStyle(
                fontSize: Responsive.scaledFontSize(context, 14),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.scaledFontSize(context, 24),
                vertical: Responsive.scaledFontSize(context, 12),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
