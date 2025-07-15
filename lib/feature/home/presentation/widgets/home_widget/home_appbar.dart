import 'package:ebozor/core/utils/size_utils.dart';
import 'package:ebozor/core/widgets/my_text.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                width: screenWidth(context),
                height: screenHeight(context) * 0.15,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Colors.blueGrey[50],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              "eBozor",
                              size: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            ),
                            Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.blueGrey,
                              size: 30,
                            ),
                          ],
                        ),
                        Spacer(),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[50],
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}