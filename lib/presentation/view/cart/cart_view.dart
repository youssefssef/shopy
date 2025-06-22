import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/presentation/view/cart/cart_viewModel.dart';
import 'package:shopy/presentation/view/cart/components/cart_checkoutButton.dart';
import 'package:shopy/presentation/view/cart/components/cart_item_list.dart';
import 'package:shopy/presentation/view/cart/components/items_trackingRow.dart';
import 'package:shopy/widgets/empty_list.dart';
import 'package:shopy/widgets/title_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CartViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const TitleText(title: 'Checkout'),
        centerTitle: true,
      ),

      bottomNavigationBar: CartCheckoutButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemsTrackingRow(),
                const Divider(),
                viewModel.items.isEmpty
                    ? EmptyList(
                      icon: Icons.shopping_cart_outlined,
                      titleText: 'Your cart is empty',
                      descriptionText: 'Start adding items to your cart!',
                      buttonIcon: Icons.store,
                      buttontext: 'Shop Now',
                    )
                    : const CartItemList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
