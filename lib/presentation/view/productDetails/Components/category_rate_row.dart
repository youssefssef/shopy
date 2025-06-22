import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';

class CategoryRateRow extends StatelessWidget {
  const CategoryRateRow({
    super.key,
    required this.category,
    required this.rate,
  });
  final String category;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color.fromARGB(255, 199, 197, 197),
              ),
            ),
            child: Text(
              category,
              style: TextStyle(
                fontSize: Responsive.scaledFontSize(context, 14),
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color.fromARGB(255, 199, 197, 197),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: Responsive.scaledFontSize(context, 20),
                ),
                Text(
                  '$rate',
                  style: TextStyle(
                    fontSize: Responsive.scaledFontSize(context, 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
