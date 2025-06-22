import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/presentation/view/favorites/favorites_viewmodel.dart';

class AddToFavorite extends StatelessWidget {
  const AddToFavorite({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) {
    final favoritesViewModel = context.watch<FavoritesViewModel>();
    final isFavorite = favoritesViewModel.favoriteIds.contains(productId);
    return Positioned(
      top: 12,
      right: 12,
      child: GestureDetector(
        onTap: () {
          favoritesViewModel.toggleFavorite(productId);
        },
        child: CircleAvatar(
          radius: Responsive.scaledFontSize(context, 18),
          backgroundColor: Colors.white,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            color: isFavorite ? Colors.red : null,
            size: Responsive.scaledFontSize(context, 24),
          ),
        ),
      ),
    );
  }
}
