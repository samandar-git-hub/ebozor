import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? suffixText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.suffixText,
    this.keyboardType,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            suffixText: suffixText,
            counterText: maxLength != null ? '' : null,
          ),
        ),
      ),
    );
  }
}