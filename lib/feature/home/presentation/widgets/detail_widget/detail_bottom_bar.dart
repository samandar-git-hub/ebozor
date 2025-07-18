import 'package:ebozor/core/utils/size_utils.dart';
import 'package:ebozor/core/widgets/my_text.dart';
import 'package:flutter/material.dart';

class DetailBottomBar extends StatelessWidget {
  const DetailBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenWidth(context) * 0.3,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.indigo,
                ),
                child: Center(child: MyText("Yozish", color: Colors.white)),
              ),
            ),
            SizedBox(
              width: screenWidth(context) * 0.6,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.indigo,
                ),
                child: Center(
                  child: MyText("Telefon raqam", color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
  }
}