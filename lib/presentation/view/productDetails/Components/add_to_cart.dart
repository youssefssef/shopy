import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/data/models/product_model.dart';
import 'package:shopy/presentation/view/cart/cart_viewModel.dart';
import 'package:shopy/presentation/view/productDetails/Components/animated_cartButton.dart';
import 'package:shopy/presentation/view/productDetails/product_details_viewModel.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.quantity, required this.product});
  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final totalPrice = (product.price * quantity).toStringAsFixed(2);
    final cartViewModel = Provider.of<CartViewModel>(context);
    final detailsviewModel = Provider.of<ProductDetailsViewModel>(context);

    return Container(
      height: Responsive.scaledFontSize(context, 90),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(255, 204, 200, 200)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            offset: Offset(0, -3), // Negative Y offset for top shadow
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total price',
                  style: TextStyle(
                    fontSize: Responsive.scaledFontSize(
                      context,
                      Responsive.scaledFontSize(context, 14),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2.4,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$$totalPrice',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: Responsive.scaledFontSize(
                                context,
                                Responsive.scaledFontSize(context, 24),
                              ), //24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '${product.discountPercentage}% off ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: Responsive.scaledFontSize(
                                context,
                                Responsive.scaledFontSize(context, 14),
                              ), //14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            AnimatedCartButton(
              buttonText: 'Add to Cart',
              icon: Icons.shopping_bag,
              onTap: () {
                cartViewModel.addToCart(product, detailsviewModel.quantity);
              },
            ),
          ],
        ),
      ),
    );
  }
}
