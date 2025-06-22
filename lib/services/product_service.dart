import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopy/core/constants/api_constants.dart';
import '../data/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getAllProducts() async {
    final uri = Uri.parse(ApiConstants.productsEndpoint);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return List<ProductModel>.from(
          data['products'].map((x) => ProductModel.fromJson(x)),
        );
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
