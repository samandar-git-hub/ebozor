import 'package:ebozor/core/extension/sizedbox_extension.dart';
import 'package:ebozor/core/utils/size_utils.dart';
import 'package:ebozor/core/widgets/my_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: screenWidth(context),
                height: screenHeight(context) * 0.2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100.withValues(alpha: 0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            40.width,
                            MyText(
                              "Profil",
                              size: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.settings),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            10.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  "Ismismismism",
                                  size: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal,
                                ),
                                MyText(
                                  "username",
                                  size: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.notifications_none),
                    10.width,
                    MyText("Bildirishnomalar"),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.notifications_none),
                    10.width,
                    MyText("Bildirishnomalar"),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.notifications_none),
                    10.width,
                    MyText("Bildirishnomalar"),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
