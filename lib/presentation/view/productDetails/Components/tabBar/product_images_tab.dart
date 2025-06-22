import 'package:flutter/material.dart';

class ProductImagesTab extends StatelessWidget {
  final List<String> images;

  const ProductImagesTab({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter, // forces content to not expand vertically
      child: SizedBox(
        height: 220,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

          itemCount: images.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFFEDE4FF), const Color(0xFFF7F3ED)],
                ),
                border: Border.all(color: const Color.fromARGB(26, 0, 0, 0)),
              ),

              child: Image.network(
                images[index],
                width: MediaQuery.sizeOf(context).width / 1.2,
              ),
            );
          },
        ),
      ),
    );
  }
}
