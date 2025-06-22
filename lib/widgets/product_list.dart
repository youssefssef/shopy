import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/data/models/product_model.dart';
import 'package:shopy/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  final bool isScrollable;

  const ProductGrid({
    required this.products,
    super.key,
    required this.isScrollable,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics:
          isScrollable
              ? null
              : const NeverScrollableScrollPhysics(), // so it works inside scrollable parents
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            Responsive.isDesktop(context)
                ? 4
                : Responsive.isTablet(context)
                ? 3
                : 2, // 2 columns
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.56, // adjust height relative to width
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }
}
