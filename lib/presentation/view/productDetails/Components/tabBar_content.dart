import 'package:flutter/material.dart';
import 'package:shopy/data/models/product_model.dart';
import 'package:shopy/presentation/view/productDetails/Components/tabBar/product_details_tab.dart';
import 'package:shopy/presentation/view/productDetails/Components/tabBar/product_images_tab.dart';
import 'package:shopy/presentation/view/productDetails/Components/tabBar/product_review_tab.dart';

class TabBarContent extends StatelessWidget {
  const TabBarContent({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ProductDetailsTab(product: product),
          ProductImagesTab(images: product.images),
          ReviewsTab(product: product),
        ],
      ),
    );
  }
}
