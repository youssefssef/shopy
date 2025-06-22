import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/presentation/view/cart/cart_viewModel.dart';
import 'package:shopy/presentation/view/cart/components/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CartViewModel>(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.items.length,
      itemBuilder: (context, index) {
        final item = viewModel.items[index].product;
        return CartItemWidget(
          item: viewModel.items[index],

          onToggle: () => viewModel.removeFromCart(item),
          onQuantityChanged: (int value) {
            viewModel.updateQuantity(item, value);
          },
        );
      },
    );
  }
}
