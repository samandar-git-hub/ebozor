import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc/ads_home_bloc.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc/ads_home_event.dart';
import 'package:ebozor/feature/home/presentation/widgets/home_widget/home_ads_list_view.dart';
import 'package:ebozor/feature/home/presentation/widgets/home_widget/home_appbar.dart';
import 'package:ebozor/feature/home/presentation/widgets/home_widget/home_carousel.dart';
import 'package:ebozor/feature/home/presentation/widgets/home_widget/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<AdsHomeBloc>().add(LoadAdsHomeEvent());
            await Future.delayed(Duration(milliseconds: 500));
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                HomeAppbar(),
                HomeCarousel(),
                SectionHeader(title: "Yangi"),
                HomeAdsListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
