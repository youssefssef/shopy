import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';

class AnimatedCartButton extends StatefulWidget {
  final String buttonText;
  final IconData icon;
  final VoidCallback onTap;
  final double width;

  const AnimatedCartButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.onTap,
    this.width = 2,
  });

  @override
  State<AnimatedCartButton> createState() => _AnimatedCartButtonState();
}

class _AnimatedCartButtonState extends State<AnimatedCartButton> {
  bool isAdded = false;

  void _handleTap() {
    setState(() => isAdded = true);
    widget.onTap();

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => isAdded = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: Responsive.scaledFontSize(context, 48),
        width: MediaQuery.sizeOf(context).width / widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue,
          boxShadow:
              isAdded
                  ? [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.6),
                      blurRadius: 12,
                      spreadRadius: 1.5,
                    ),
                  ]
                  : [],
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child:
                isAdded
                    ? Icon(
                      Icons.check_circle,
                      key: const ValueKey('check'),
                      color: Colors.white,
                      size: Responsive.scaledFontSize(context, 30),
                    )
                    : Row(
                      key: const ValueKey('normal'),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          widget.icon,
                          color: Colors.white,
                          size: Responsive.scaledFontSize(context, 30),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.buttonText,
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
