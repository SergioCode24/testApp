import 'package:flutter/material.dart';

class TextFieldSample extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;

  const TextFieldSample(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
