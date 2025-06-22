import 'package:flutter/material.dart';
import 'package:number_selection/number_selection.dart';
import 'package:shopy/core/utils/responsive.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.initialValue,
    required this.minValue,
    required this.onChanged,
  });
  final int initialValue;
  final int minValue;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.scaledFontSize(context, 50),
      width: Responsive.scaledFontSize(context, 75),
      child: NumberSelection(
        theme: NumberSelectionTheme(
          draggableCircleColor: Colors.blue,
          iconsColor: Theme.of(context).textTheme.titleLarge?.color,
          numberColor: Colors.white,
          backgroundColor: Theme.of(
            context,
          ).textTheme.titleLarge?.color?.withValues(alpha: 0.20),
          outOfConstraintsColor: Colors.deepOrange,
        ),
        initialValue: initialValue,
        minValue: minValue,

        direction: Axis.horizontal,
        withSpring: true,
        onChanged: onChanged,
        enableOnOutOfConstraintsAnimation: true,
        onOutOfConstraints: () => print("This value is too high or too low"),
      ),
    );
  }
}
