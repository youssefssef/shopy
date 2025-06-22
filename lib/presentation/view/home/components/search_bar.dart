import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/core/utils/responsive.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 15),
      child: GestureDetector(
        onTap: () {
          context.push('/search');
        },
        child: Container(
          height: 48,
          width: MediaQuery.sizeOf(context).width / 1.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3), // horizontal, vertical
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.search,
                color: Colors.black38,
                size: Responsive.scaledFontSize(context, 16),
              ),
              SizedBox(width: 10),
              Text(
                'Search for...',
                style: TextStyle(
                  fontSize: Responsive.scaledFontSize(context, 16),
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
