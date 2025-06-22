import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/presentation/view/home/components/product_itemCard.dart';
import 'package:shopy/presentation/view/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final topRated = viewModel.getRandomTopRatedProducts(
      viewModel.products,
      2.5,
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(241, 255, 255, 255),
      body:
          viewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ProductItemCard(topProducts: topRated),
    );
  }
}
