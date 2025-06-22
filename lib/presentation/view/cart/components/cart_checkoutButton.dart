import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/presentation/view/cart/cart_viewModel.dart';
import 'package:shopy/widgets/cart_button.dart';

class CartCheckoutButton extends StatelessWidget {
  const CartCheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CartViewModel>(context);
    return Container(
      height: Responsive.scaledFontSize(context, 80),
      decoration: BoxDecoration(
        color: Colors.white,

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
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total : ',
                  style: TextStyle(
                    fontSize: Responsive.scaledFontSize(context, 14),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 3,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '\$${viewModel.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: Responsive.scaledFontSize(context, 26),
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CartButton(
              icon: Icons.shopping_cart_checkout,
              buttonText: 'Checkout Now',
              clicable: viewModel.totalPrice != 0,
              onTap: () {
                context.push('/checkout');
              },
            ),
          ],
        ),
      ),
    );
  }
}
