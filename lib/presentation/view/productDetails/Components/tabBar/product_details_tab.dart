import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/data/models/product_model.dart';

class ProductDetailsTab extends StatelessWidget {
  const ProductDetailsTab({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dimensions = product.dimensions;
    final dimensionText =
        '${dimensions.width}W x ${dimensions.height}H x ${dimensions.depth}D cm';
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: Responsive.scaledFontSize(context, 10),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: TextStyle(
                fontSize: Responsive.scaledFontSize(context, 20),
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: TextStyle(
                fontSize: Responsive.scaledFontSize(context, 14),
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Each detail row
            _buildDetailRow(
              'unit price',
              '${product.price}',
              Icons.payment,
              context,
            ),
            _buildDetailRow(
              'Weight',
              '${product.weight}',
              Icons.scale,
              context,
            ),
            _buildDetailRow('Dimensions', dimensionText, Icons.height, context),
            _buildDetailRow(
              'Warranty',
              product.warrantyInformation,
              Icons.warning_rounded,
              context,
            ),
            _buildDetailRow(
              'Shipping',
              product.shippingInformation,
              Icons.local_shipping,
              context,
            ),
            _buildDetailRow(
              'Return Policy',
              product.returnPolicy,
              Icons.policy,
              context,
            ),
            _buildDetailRow(
              'Minimum Order Quantity',
              '${product.minimumOrderQuantity}',
              Icons.production_quantity_limits,
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String title,
    String value,
    IconData icon,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card.filled(
        color: const Color.fromARGB(255, 203, 230, 253),
        shadowColor: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: Responsive.scaledFontSize(context, 22)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    fontSize: Responsive.scaledFontSize(context, 12),
                  ),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Responsive.scaledFontSize(context, 12),
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
