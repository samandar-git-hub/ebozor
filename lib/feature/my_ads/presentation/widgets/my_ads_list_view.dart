import 'package:ebozor/core/utils/size_utils.dart';
import 'package:ebozor/core/utils/format_date_time.dart';
import 'package:ebozor/core/widgets/my_text.dart';
import 'package:ebozor/feature/my_ads/presentation/bloc/my_ads_bloc.dart';
import 'package:ebozor/feature/my_ads/presentation/bloc/my_ads_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyAdsListView extends StatelessWidget {
  const MyAdsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAdsBloc, MyAdsState>(
      builder: (context, state) {
        if (state is MyAdsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MyAdsError) {
          return Center(child: MyText(state.message));
        } else if (state is MyAdsLoaded) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: state.myAds.length,
            itemBuilder: (context, index) {
              final ad = state.myAds[index];
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
          );
        }
        return MyText("obbo");
      },
    );
  }
}
