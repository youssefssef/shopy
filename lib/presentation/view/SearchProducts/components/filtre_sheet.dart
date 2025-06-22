import 'package:flutter/material.dart';

void showFilterBottomSheet(
  BuildContext context, {
  required double minPrice,
  required double maxPrice,
  required double currentMinPrice,
  required double currentMaxPrice,
  required double currentMinRating,
  required Function(double, double, double) onApply,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      double selectedMinPrice = currentMinPrice;
      double selectedMaxPrice = currentMaxPrice;
      double selectedRating = currentMinRating;

      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Filter Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                // Price Range Slider
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Price Range"),
                    RangeSlider(
                      values: RangeValues(selectedMinPrice, selectedMaxPrice),
                      activeColor: Colors.blue,

                      min: minPrice,
                      max: maxPrice,
                      divisions: 20,
                      labels: RangeLabels(
                        '\$${selectedMinPrice.toStringAsFixed(0)}',
                        '\$${selectedMaxPrice.toStringAsFixed(0)}',
                      ),
                      onChanged: (range) {
                        setState(() {
                          selectedMinPrice = range.start;
                          selectedMaxPrice = range.end;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Rating Slider
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Minimum Rating"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        double starIndex = index + 1;
                        return IconButton(
                          icon: Icon(
                            starIndex <= selectedRating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 32,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedRating = starIndex;
                            });
                          },
                        );
                      }),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Apply Button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    onApply(selectedMinPrice, selectedMaxPrice, selectedRating);
                  },
                  child: Container(
                    height: 48,
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        'Apply filtres',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
