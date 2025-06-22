import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopy/core/constants/api_constants.dart';
import 'package:shopy/data/models/OrderModel.dart';

class OrderService {
  Future<bool> submitOrder(OrderModel order) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.orderApi),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(order.toJson()),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        debugPrint('Order failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint('Order error: $e');
      return false;
    }
  }
}
