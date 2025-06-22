import 'package:flutter/material.dart';
import 'package:shopy/data/models/product_model.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  int _quantity;
  final double unitPrice;

  ProductDetailsViewModel({
    required int initialQuantity,
    required this.unitPrice,
    required ProductModel product,
  }) : _quantity = initialQuantity;

  int get quantity => _quantity;

  double get totalPrice => _quantity * unitPrice;

  void updateQuantity(int newQuantity) {
    _quantity = newQuantity;
    notifyListeners();
  }
}
