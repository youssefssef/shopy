import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/presentation/view/cart/cart_viewModel.dart';
import 'package:shopy/presentation/view/checkout/chekout_viewmodel.dart';

class ItemsTrackingRow extends StatelessWidget {
  const ItemsTrackingRow({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CartViewModel>(context);
    final checkoutViewModel = context.watch<CheckoutViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${viewModel.items.length} items',
          style: TextStyle(
            fontSize: Responsive.scaledFontSize(context, 14),
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
        if (checkoutViewModel.orders.isNotEmpty)
          GestureDetector(
            onTap: () {
              context.push('/tracking');
            },
            child: Text(
              '${checkoutViewModel.orders.length}Tracking',
              style: TextStyle(
                fontSize: Responsive.scaledFontSize(context, 14),
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
