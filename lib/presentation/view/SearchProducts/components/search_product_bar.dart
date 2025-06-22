import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/presentation/view/SearchProducts/controllers/search_controllers.dart';
import 'package:shopy/presentation/view/home/home_viewmodel.dart';

class SearchProductBar extends StatelessWidget {
  const SearchProductBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return SearchBar(
      controller: searchController,
      constraints: BoxConstraints(minHeight: 30),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ), // 👈 Change this value as needed
        ),
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },

      leading: Icon(Icons.search, size: Responsive.scaledFontSize(context, 24)),
      hintText: 'Search by name, brand,category....',

      onSubmitted: (value) {
        homeViewModel.searchProducts(value);
      },
      trailing: <Widget>[
        IconButton(
          onPressed: () {
            searchController.clear();
            homeViewModel.resetSearch();
          },
          icon: Icon(Icons.close, size: Responsive.scaledFontSize(context, 24)),
        ),
      ],
    );
  }
}
