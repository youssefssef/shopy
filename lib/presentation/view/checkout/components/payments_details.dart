import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/presentation/view/checkout/components/checkouts_textfields.dart';
import 'package:shopy/presentation/view/checkout/controllers/checkout_controllers.dart';

class PaymentsDetails extends StatelessWidget {
  const PaymentsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Payment Details',
          style: TextStyle(
            fontSize: Responsive.scaledFontSize(context, 18),
            fontWeight: FontWeight.bold,
          ),
        ),
        buildTextField(
          context: context,
          label: 'Card Number',
          controller: cardNumberController,
          type: TextInputType.number,
          prefixIcon: Icon(
            Icons.payment,
            size: Responsive.scaledFontSize(context, 24),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: buildTextField(
                context: context,
                label: 'Expiration (MM/YY)',
                controller: expiryController,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: buildTextField(
                context: context,
                label: 'CVV',
                controller: cvvController,
                type: TextInputType.number,
                obscure: true,
              ),
            ),
          ],
        ),
        buildTextField(
          context: context,
          label: 'Card holder name',
          controller: cardNameController,
        ),
      ],
    );
  }
}
