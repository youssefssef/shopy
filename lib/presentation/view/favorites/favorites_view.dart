import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/presentation/view/favorites/Components/total_favorites_item.dart';
import 'package:shopy/presentation/view/favorites/favorites_viewmodel.dart';
import 'package:shopy/presentation/view/home/home_viewmodel.dart';
import 'package:shopy/widgets/empty_list.dart';
import 'package:shopy/widgets/product_list.dart';
import 'package:shopy/widgets/title_text.dart';

class FavoritsProductView extends StatelessWidget {
  const FavoritsProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesViewModel = context.watch<FavoritesViewModel>();
    final homeViewModel = context.watch<HomeViewModel>();

    final favoriteProducts =
        homeViewModel.products
            .where(
              (product) => favoritesViewModel.favoriteIds.contains(product.id),
            )
            .toList();
    return Scaffold(
      appBar: AppBar(title: TitleText(title: 'Favorites'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TotalFavoritesItems(favoriteProducts: favoriteProducts),
            favoriteProducts.isEmpty
                ? Expanded(
                  child: EmptyList(
                    icon: Icons.favorite_border,
                    titleText: 'No favorites yet',
                    descriptionText:
                        'Browse products and tap the heart to save them.',
                    buttonIcon: Icons.explore,
                    buttontext: 'Explore Products',
                  ),
                )
                : ProductGrid(products: favoriteProducts, isScrollable: false),
          ],
        ),
      ),
    );
  }
}
