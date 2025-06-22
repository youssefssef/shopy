import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/data/models/product_model.dart';

class TotalFavoritesItems extends StatelessWidget {
  const TotalFavoritesItems({super.key, required this.favoriteProducts});
  final List<ProductModel> favoriteProducts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Favorites Items',
            style: TextStyle(
              fontSize: Responsive.scaledFontSize(context, 20),
              fontWeight: FontWeight.w600,
            ),
          ),

          if (favoriteProducts.isNotEmpty)
            Text(
              '${favoriteProducts.length} Items',
              style: TextStyle(
                fontSize: Responsive.scaledFontSize(context, 16),
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}
