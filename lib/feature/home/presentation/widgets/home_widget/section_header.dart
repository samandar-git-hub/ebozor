import 'package:ebozor/core/widgets/my_text.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [MyText(title, size: 20, fontWeight: FontWeight.w500)],
      ),
    );
  }
}
