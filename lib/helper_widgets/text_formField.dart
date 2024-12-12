import 'package:flutter/material.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required String labelText,
  required String hintText,
  TextInputType inputType = TextInputType.text,
  bool obscureText = false,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: const OutlineInputBorder(),
    ),
    validator: validator,
    onChanged: onChanged,
  );
}
