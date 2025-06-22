import 'package:flutter/material.dart';
import 'package:shopy/core/utils/responsive.dart';

Widget buildTextField({
  required BuildContext context,
  required String label,
  required TextEditingController controller,
  TextInputType type = TextInputType.text,
  Widget? prefixIcon,
  bool obscure = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      style: TextStyle(fontSize: Responsive.scaledFontSize(context, 18)),

      validator:
          (value) => value == null || value.isEmpty ? 'Champ requis' : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: Responsive.scaledFontSize(context, 16)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: prefixIcon,
      ),
    ),
  );
}
