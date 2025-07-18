import 'package:ebozor/core/extension/sizedbox_extension.dart';
import 'package:ebozor/core/utils/size_utils.dart';
import 'package:ebozor/core/utils/format_date_time.dart';
import 'package:ebozor/core/widgets/my_text.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc/ads_home_bloc.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc/ads_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeAdsListView extends StatelessWidget {
  const HomeAdsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsHomeBloc, AdsHomeState>(
      builder: (context, state) {
        if (state is AdsHomeLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AdsHomeError) {
          return Center(child: MyText(state.message));
        } else if (state is AdsHomeLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              separatorBuilder: (context, index) => 10.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: state.ads.length,
              itemBuilder: (context, index) {
                final ad = state.ads[index];
                return GestureDetector(
                  onTap: () {
                    context.push('/detail', extra: ad.id);
                  },
                  child: SizedBox(
                    width: screenWidth(context) * 0.5,
                    height: 300,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueGrey.shade100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth(context),
                              height: 200,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                            MyText(ad.title),
                            MyText(ad.price.toString()),
                            MyText(formatDateTime(ad.date).toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return MyText("obbo");
      },
    );
  }
}
