import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/presentation/view/checkout/chekout_viewmodel.dart';
import 'package:shopy/presentation/view/home/home_viewmodel.dart';
import 'package:shopy/widgets/title_text.dart';

class TrackingOrders extends StatelessWidget {
  const TrackingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutViewModel = context.watch<CheckoutViewModel>();
    final homeViewModel = context.watch<HomeViewModel>();

    final orders = checkoutViewModel.orders; // directly use ViewModel's list
    final allProducts = homeViewModel.products;

    if (orders.isEmpty) {
      return const Center(child: Text('No orders placed yet.'));
    }
    return Scaffold(
      appBar: AppBar(title: TitleText(title: 'Tracking'), centerTitle: true),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Card(
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Date: ${DateFormat.yMMMd().format(order.date)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.scaledFontSize(context, 14),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...order.items.map((item) {
                    final product = allProducts.firstWhere(
                      (p) => p.id == item.productId,
                    );

                    return GestureDetector(
                      onTap: () {
                        context.push(
                          '/product/${product.id}',
                          extra: product, // ✅ This is essential!
                        );
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Image.network(
                          product.thumbnail,
                          width: Responsive.scaledFontSize(context, 50),
                          height: Responsive.scaledFontSize(context, 50),
                          fit: BoxFit.cover,
                        ),
                        title: Text(product.title),
                        subtitle: Text(
                          'Quantity: ${item.quantity}',
                          style: TextStyle(
                            fontSize: Responsive.scaledFontSize(context, 14),
                          ),
                        ),
                        trailing: Text(
                          '\$${(product.price * item.quantity).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: Responsive.scaledFontSize(context, 14),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
