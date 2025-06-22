import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/data/models/cart_item.dart';
import 'package:shopy/widgets/quantity_selector.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onToggle;
  final ValueChanged<int> onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onToggle,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final productPrice = (item.product.price * item.quantity).toStringAsFixed(
      2,
    );
    return GestureDetector(
      onTap: () {
        context.push(
          '/product/${item.product.id}',
          extra: item.product, // ✅ This is essential!
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),

        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.product.thumbnail,
                height: Responsive.scaledFontSize(context, 100),
                width: Responsive.scaledFontSize(context, 100),
              ),
            ),
            const SizedBox(width: 12),

            // Title and price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.title,
                    style: TextStyle(
                      fontSize: Responsive.scaledFontSize(context, 16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$$productPrice',
                    style: TextStyle(
                      fontSize: Responsive.scaledFontSize(context, 14),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: onToggle,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: Responsive.scaledFontSize(context, 24),
                  ),
                ),

                QuantitySelector(
                  initialValue: item.quantity,
                  minValue: item.product.minimumOrderQuantity,
                  onChanged: onQuantityChanged,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
