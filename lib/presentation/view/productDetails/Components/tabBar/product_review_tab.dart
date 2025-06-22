import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/data/models/product_model.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      itemCount: product.reviews.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final review = product.reviews[index];
        final rawDate = review.date;
        final formattedDate = DateFormat(
          'dd MMM yyyy – HH:mm',
        ).format(DateTime.parse(rawDate));

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: Responsive.scaledFontSize(context, 20),
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person_2,
                  color: Colors.white,
                  size: Responsive.scaledFontSize(context, 24),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // pushes items apart
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review.reviewerName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Responsive.scaledFontSize(context, 16),
                          ),
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              i < review.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: Responsive.scaledFontSize(context, 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      review.comment,
                      style: TextStyle(
                        fontSize: Responsive.scaledFontSize(context, 14),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Responsive.scaledFontSize(context, 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
