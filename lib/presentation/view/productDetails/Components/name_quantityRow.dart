import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/widgets/quantity_selector.dart';

class ProductNameQuanitytRow extends StatelessWidget {
  const ProductNameQuanitytRow({
    super.key,
    required this.prouctName,
    required this.initialValue,
    required this.minValue,
    required this.onChanged,
  });
  final String prouctName;
  final int initialValue;
  final int minValue;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 10, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 1.7,
            child: Text(
              prouctName,
              style: GoogleFonts.poppins(
                fontSize: Responsive.scaledFontSize(context, 24),
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 2,
            ),
          ),

          QuantitySelector(
            initialValue: initialValue,
            minValue: minValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
