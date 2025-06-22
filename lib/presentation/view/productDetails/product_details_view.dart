import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/data/models/product_model.dart';
import 'package:shopy/presentation/view/productDetails/Components/product_viewContent.dart';
import 'package:shopy/presentation/view/productDetails/product_details_viewModel.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) => ProductDetailsViewModel(
            product: product,
            initialQuantity: product.minimumOrderQuantity,
            unitPrice: product.price,
          ),
      child: ProductDetailsViewContent(product: product),
    );
  }
}
