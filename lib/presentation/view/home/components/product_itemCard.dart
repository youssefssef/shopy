import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopy/data/models/product_model.dart';
import 'package:shopy/presentation/view/home/components/category_section.dart';
import 'package:shopy/presentation/view/home/components/home_title.dart';
import 'package:shopy/presentation/view/home/components/search_bar.dart';
import 'package:shopy/presentation/view/home/components/section_row.dart';
import 'package:shopy/presentation/view/home/home_viewmodel.dart';
import 'package:shopy/widgets/product_list.dart';

class ProductItemCard extends StatelessWidget {
  final List<ProductModel> topProducts;

  const ProductItemCard({super.key, required this.topProducts});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTitle(),
            SearchBarWidget(),
            SectionRow(
              title: 'Category',
              prefixText: 'See all',
              onTap: () => context.push('/search'),
            ),
            CategorySection(),
            SectionRow(
              title: 'Top Picks for You',
              prefixText: 'See more',
              onTap: () {
                context.push('/search');
                viewModel.searchProducts('', minRating: 3);
              },
            ),

            ProductGrid(products: topProducts, isScrollable: false),
          ],
        ),
      ),
    );
  }
}
