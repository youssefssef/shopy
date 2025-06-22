import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';

class DetailsTapBar extends StatelessWidget {
  const DetailsTapBar({super.key, required this.totalReviews});
  final int totalReviews;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.symmetric(horizontal: 10),
      labelColor: Colors.blue,
      indicatorColor: Colors.blue,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      labelStyle: TextStyle(fontSize: Responsive.scaledFontSize(context, 14)),

      tabs: [
        Tab(
          text: 'Details',
          icon: Icon(
            Icons.description_outlined,
            size: Responsive.scaledFontSize(context, 24),
          ),
        ),
        Tab(
          text: 'Images',
          icon: Icon(
            Icons.image_outlined,
            size: Responsive.scaledFontSize(context, 24),
          ),
        ),
        Tab(
          text: 'Reviews($totalReviews)',
          icon: Icon(
            Icons.reviews_outlined,
            size: Responsive.scaledFontSize(context, 24),
          ),
        ),
      ],
    );
  }
}
