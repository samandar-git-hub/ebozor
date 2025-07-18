import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebozor/core/utils/size_utils.dart';
import 'package:ebozor/core/widgets/my_text.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        5,
        (index) => SizedBox(
          width: screenWidth(context) * 0.8,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue.shade100),
            child: MyText("aaaaaaaaaaaaaaaaa"),
          ),
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        height: 160,
        viewportFraction: 0.85,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
    );
  }
}
