import 'package:ebozor/core/extension/sizedbox_extension.dart';
import 'package:ebozor/core/widgets/my_text.dart';
import 'package:ebozor/feature/my_ads/presentation/bloc/my_ads_bloc.dart';
import 'package:ebozor/feature/my_ads/presentation/bloc/my_ads_event.dart';
import 'package:ebozor/feature/my_ads/presentation/widgets/my_ads_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyAdsBloc>().add(MyAdsLoadEvent(userId: "userId"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  MyText("E'lonlar", size: 20),
                  40.width,
                ],
              ),
              MyAdsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
