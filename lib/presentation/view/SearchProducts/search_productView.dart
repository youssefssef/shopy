import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/presentation/view/SearchProducts/components/filtre_button.dart';
import 'package:shopy/presentation/view/SearchProducts/components/search_product_bar.dart';
import 'package:shopy/presentation/view/home/home_viewmodel.dart';
import 'package:shopy/widgets/product_list.dart';

class SearchProductView extends StatelessWidget {
  const SearchProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 241, 241),
        automaticallyImplyLeading: false,
        title: SearchProductBar(),
        actions: [FiltreButton()],
      ),
      body: ProductGrid(
        products: homeViewModel.filtredproducts,
        isScrollable: true,
      ),
    );
  }
}
