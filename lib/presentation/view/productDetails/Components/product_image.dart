import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/widgets/add_to_favorite.dart';
import 'package:shopy/widgets/back_button.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image, required this.productId});
  final String image;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.scaledFontSize(context, 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFFEDE4FF), const Color(0xFFF7F3ED)],
        ),
        image: DecorationImage(image: NetworkImage(image)),
      ),
      child: Stack(
        children: [AddToFavorite(productId: productId), BackButtonWidget()],
      ),
    );
  }
}
