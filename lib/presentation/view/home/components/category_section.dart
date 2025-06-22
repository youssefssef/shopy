import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/presentation/view/home/home_viewmodel.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.brush, 'label': 'Beauty'},
    {'icon': Icons.ac_unit, 'label': 'Fragrance'},
    {'icon': Icons.weekend, 'label': 'Furniture'},
    {'icon': Icons.shopping_basket, 'label': 'Grocerie'},
  ];

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    return SizedBox(
      height: Responsive.scaledFontSize(context, 100),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(items.length, (index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push('/search');
                        homeViewModel.searchProducts(
                          '',
                          category: item['label'],
                        );
                      },
                      child: Container(
                        width: Responsive.scaledFontSize(context, 50),
                        height: Responsive.scaledFontSize(context, 50),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item['icon'],
                          size: Responsive.scaledFontSize(context, 30),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['label'],
                      style: TextStyle(
                        fontSize: Responsive.scaledFontSize(context, 14),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
