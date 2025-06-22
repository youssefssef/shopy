import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy/data/models/OrderModel.dart';
import 'package:shopy/data/models/cart_item.dart';
import 'package:shopy/data/models/placeOrder.dart';
import 'package:shopy/services/order_service.dart';

class CheckoutViewModel extends ChangeNotifier {
  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  final SharedPreferences prefs;
  final OrderService orderService;

  CheckoutViewModel(this.prefs, this.orderService);

  List<PlacedOrder> _orders = [];
  List<PlacedOrder> get orders => _orders;

  static const _ordersKey = 'placed_orders';

  Future<void> submitOrder({
    required OrderModel order,
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    _isSubmitting = true;
    notifyListeners();

    final success = await orderService.submitOrder(order);

    if (success) {
      onSuccess();
    } else {
      onError();
    }

    _isSubmitting = false;
    notifyListeners();
  }

  Future<void> storePlacedOrder(
    List<CartItem> cartItems,
    double totalPrice,
  ) async {
    final List<SimpleOrderItem> simpleItems =
        cartItems
            .map(
              (item) => SimpleOrderItem(
                productId: item.product.id,
                quantity: item.quantity,
              ),
            )
            .toList();

    final placedOrder = PlacedOrder(
      items: simpleItems,
      date: DateTime.now(),
      total: totalPrice, // Pass total price here
    );

    // Get existing orders
    final existingData = prefs.getStringList(_ordersKey) ?? [];

    // Add new order
    existingData.add(jsonEncode(placedOrder.toJson()));

    // Save back
    await prefs.setStringList(_ordersKey, existingData);
    _orders.add(placedOrder);
    notifyListeners();
  }

  void loadPlacedOrders() {
    final rawData = prefs.getStringList(_ordersKey) ?? [];
    _orders =
        rawData
            .map((jsonStr) => PlacedOrder.fromJson(jsonDecode(jsonStr)))
            .where((order) => order.items.isNotEmpty) // filter empty
            .toList();
    notifyListeners();
  }
}
