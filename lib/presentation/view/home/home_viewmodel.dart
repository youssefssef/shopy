import 'dart:math';

import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';
import '../../../services/product_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ProductService _service;

  HomeViewModel(this._service);

  List<ProductModel> _products = [];
  List<ProductModel> _filteredProducts = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  List<ProductModel> get filtredproducts => _filteredProducts;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _service.getAllProducts();
    } catch (e) {
      print("Error fetching products: $e");
    }

    _isLoading = false;

    _filteredProducts = _products;
    notifyListeners();
  }

  List<ProductModel> getRandomTopRatedProducts(
    List<ProductModel> products,
    double minRating, {
    int count = 5,
  }) {
    final eligible =
        products.where((product) => product.rating >= minRating).toList();

    eligible.shuffle(Random());

    // If there are fewer than `count`, just return them all
    if (eligible.length <= count) {
      return eligible;
    }

    // Randomly pick `count` items
    return eligible.sublist(0, count);
  }

  void searchProducts(
    String query, {
    double? minPrice,
    double? maxPrice,
    double? minRating,
    String? category,
  }) {
    query = query.trim().toLowerCase();

    _filteredProducts =
        _products.where((product) {
          final title = product.title.toLowerCase();
          final brand = product.brand.toLowerCase();
          final prodCategory = product.category.toLowerCase();

          final matchesText =
              title.contains(query) ||
              brand.contains(query) ||
              prodCategory.contains(query);

          final matchesMinPrice = minPrice == null || product.price >= minPrice;
          final matchesMaxPrice = maxPrice == null || product.price <= maxPrice;
          final matchesRating =
              minRating == null || product.rating >= minRating;
          final matchesCategory =
              category == null || prodCategory.contains(category.toLowerCase());

          return matchesText &&
              matchesMinPrice &&
              matchesMaxPrice &&
              matchesRating &&
              matchesCategory;
        }).toList();

    notifyListeners();
  }

  void resetSearch() {
    _filteredProducts = _products;
    notifyListeners();
  }
}
