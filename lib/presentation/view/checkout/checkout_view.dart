import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shopy/data/models/OrderModel.dart';
import 'package:shopy/presentation/view/cart/cart_viewModel.dart';
import 'package:shopy/presentation/view/checkout/chekout_viewmodel.dart';
import 'package:shopy/presentation/view/checkout/components/delivery_details.dart';
import 'package:shopy/presentation/view/checkout/components/payments_details.dart';
import 'package:shopy/presentation/view/checkout/controllers/checkout_controllers.dart';
import 'package:shopy/widgets/cart_button.dart';
import 'package:shopy/widgets/title_text.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    cardNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkoutViewModel = Provider.of<CheckoutViewModel>(context);
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const TitleText(title: 'Checkout Informations'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🚚 Delivery Info
              DeliveryDetails(),
              const SizedBox(height: 24),
              // 💳 Payment Info
              PaymentsDetails(),
              const SizedBox(height: 30),
              // Submit button
              CartButton(
                icon: Icons.shopping_bag,
                buttonText: 'Confirme Payment',
                onTap: () {
                  final order = OrderModel(
                    name: nameController.text,
                    phone: phoneController.text,
                    address: addressController.text,
                    cardNumber: cardNumberController.text,
                    expiration: expiryController.text,
                    cvv: cvvController.text,
                    items: cartViewModel.items,
                    total: cartViewModel.totalPrice,
                  );

                  checkoutViewModel.submitOrder(
                    order: order,
                    onSuccess: () {
                      QuickAlert.show(
                        context: context,

                        type: QuickAlertType.success,
                        text: 'Transaction Completed Successfully!',
                        onConfirmBtnTap: () {
                          checkoutViewModel.storePlacedOrder(
                            cartViewModel.items,
                            cartViewModel.totalPrice,
                          );
                          cartViewModel.clearCart();
                          context.go('/cart');
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      );
                    },
                    onError: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        text:
                            'Failed to complete the transaction. Please try again.',
                        onConfirmBtnTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      );
                    },
                  );
                },
                isSubmitting: checkoutViewModel.isSubmitting,
                width: 1.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
