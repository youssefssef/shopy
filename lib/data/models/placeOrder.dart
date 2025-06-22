class PlacedOrder {
  final List<SimpleOrderItem> items;
  final DateTime date;
  final double total; // Add total here

  PlacedOrder({required this.items, required this.date, required this.total});

  Map<String, dynamic> toJson() => {
    'items': items.map((e) => e.toJson()).toList(),
    'date': date.toIso8601String(),
    'total': total,
  };

  factory PlacedOrder.fromJson(Map<String, dynamic> json) {
    return PlacedOrder(
      items:
          (json['items'] as List)
              .map((e) => SimpleOrderItem.fromJson(e))
              .toList(),
      date: DateTime.parse(json['date']),
      total: (json['total'] ?? 0).toDouble(),
    );
  }
}

class SimpleOrderItem {
  final int productId;
  final int quantity;

  SimpleOrderItem({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'quantity': quantity,
  };

  factory SimpleOrderItem.fromJson(Map<String, dynamic> json) {
    return SimpleOrderItem(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}
