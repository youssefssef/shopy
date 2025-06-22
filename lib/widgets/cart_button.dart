import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.icon,
    required this.buttonText,
    required this.onTap,
    this.width = 2,
    this.clicable = true,
    this.isSubmitting = false,
  });

  final IconData icon;
  final String buttonText;
  final VoidCallback onTap;
  final double width;
  final bool clicable;
  final bool isSubmitting; // 🔥 NEW

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clicable && !isSubmitting ? onTap : () {},

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: Responsive.scaledFontSize(context, 48),
        width: MediaQuery.sizeOf(context).width / width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: clicable ? Colors.blue : Colors.grey,
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child:
                isSubmitting
                    ? SizedBox(
                      key: const ValueKey('spinner'),
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                    : Row(
                      key: const ValueKey('normal'),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          color: Colors.white,
                          size: Responsive.scaledFontSize(context, 30),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          buttonText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Responsive.scaledFontSize(context, 18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
