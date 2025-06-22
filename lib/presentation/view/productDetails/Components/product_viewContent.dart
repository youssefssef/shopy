import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/data/models/product_model.dart';
import 'package:shopy/presentation/view/productDetails/Components/add_to_cart.dart';
import 'package:shopy/presentation/view/productDetails/Components/category_rate_row.dart';
import 'package:shopy/presentation/view/productDetails/Components/details_tapbar.dart';
import 'package:shopy/presentation/view/productDetails/Components/name_quantityRow.dart';
import 'package:shopy/presentation/view/productDetails/Components/product_image.dart';
import 'package:shopy/presentation/view/productDetails/Components/tabBar_content.dart';
import 'package:shopy/presentation/view/productDetails/product_details_viewModel.dart';

class ProductDetailsViewContent extends StatelessWidget {
  const ProductDetailsViewContent({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductDetailsViewModel>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: AddToCart(
          product: product,
          quantity: viewModel.quantity,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(image: product.thumbnail, productId: product.id),
                SizedBox(height: Responsive.scaledFontSize(context, 10)),
                // for category and rating row
                CategoryRateRow(
                  category: product.category,
                  rate: product.rating,
                ),

                //for product name and quantity selector
                ProductNameQuanitytRow(
                  prouctName: product.title,
                  initialValue: product.minimumOrderQuantity,
                  minValue: product.minimumOrderQuantity,
                  onChanged: viewModel.updateQuantity,
                ),

                if (product.brand != '')
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 2),
                    child: Text(
                      product.brand,
                      style: TextStyle(
                        fontSize: Responsive.scaledFontSize(context, 16),
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8E44AD), // Your main theme color
                      ),
                    ),
                  ),
                SizedBox(height: 13),
                DetailsTapBar(totalReviews: product.reviews.length),
                SizedBox(
                  height: null,
                  child: Column(children: [TabBarContent(product: product)]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
