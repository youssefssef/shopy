import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/presentation/view/checkout/components/checkouts_textfields.dart';
import 'package:shopy/presentation/view/checkout/controllers/checkout_controllers.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Details',
          style: TextStyle(
            fontSize: Responsive.scaledFontSize(context, 18),
            fontWeight: FontWeight.bold,
          ),
        ),
        buildTextField(
          context: context,
          label: 'Full Name...',
          controller: nameController,
          prefixIcon: Icon(
            Icons.person_2,
            size: Responsive.scaledFontSize(context, 24),
          ),
        ),
        buildTextField(
          context: context,
          label: 'Phone Number',
          controller: phoneController,
          type: TextInputType.phone,
          prefixIcon: Icon(
            Icons.phone,
            size: Responsive.scaledFontSize(context, 24),
          ),
        ),
        buildTextField(
          context: context,
          label: 'address',
          controller: addressController,
          prefixIcon: Icon(
            Icons.pin_drop,
            size: Responsive.scaledFontSize(context, 24),
          ),
        ),
      ],
    );
  }
}
