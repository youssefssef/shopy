import 'cart_item.dart'; // Assurez-vous que vous avez déjà ce modèle

class OrderModel {
  final String name;
  final String phone;
  final String address;

  final String cardNumber;
  final String expiration;
  final String cvv;

  final List<CartItem> items;
  final double total;

  OrderModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.cardNumber,
    required this.expiration,
    required this.cvv,
    required this.items,
    required this.total,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': {'name': name, 'phone': phone, 'address': address},
      'payment': {
        'cardNumber': cardNumber,
        'expiration': expiration,
        'cvv': cvv,
      },
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
    };
  }
}
