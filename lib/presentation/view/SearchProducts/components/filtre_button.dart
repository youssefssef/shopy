import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/presentation/view/SearchProducts/components/filtre_sheet.dart';
import 'package:shopy/presentation/view/home/home_viewmodel.dart';

class FiltreButton extends StatelessWidget {
  const FiltreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return GestureDetector(
      onTap: () {
        showFilterBottomSheet(
          context,
          minPrice: 0,
          maxPrice: 500,
          currentMinPrice: 0,
          currentMaxPrice: 300,
          currentMinRating: 2,
          onApply: (min, max, rating) {
            homeViewModel.searchProducts(
              '',
              minPrice: min,
              maxPrice: max,
              minRating: rating,
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, top: 5),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Icon(
          Icons.cable,
          color: Colors.white,
          size: Responsive.scaledFontSize(context, 24),
        ),
      ),
    );
  }
}
