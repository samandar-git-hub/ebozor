import 'package:ebozor/core/extension/sizedbox_extension.dart';
import 'package:ebozor/core/utils/size_utils.dart';
import 'package:ebozor/core/utils/format_date_time.dart';
import 'package:ebozor/core/widgets/my_text.dart';
import 'package:ebozor/feature/home/presentation/bloc/ad_detail_bloc/ad_detail_bloc.dart';
import 'package:ebozor/feature/home/presentation/bloc/ad_detail_bloc/ad_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailAdView extends StatelessWidget {
  const DetailAdView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdDetailBloc, AdDetailState>(
      builder: (context, state) {
        if (state is AdDetailLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AdDetailError) {
          return Text(state.message);
        } else if (state is AdDetailLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: -10,
                      child: SizedBox(
                        width: screenWidth(context),
                        height: 310,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[500],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth(context),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        MyText(state.ad.title, size: 20),
                        MyText(
                          "${state.ad.price} so'm",
                          size: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal,
                        ),
                        Divider(
                          color: Colors.blueGrey.shade100,
                          thickness: 0.5,
                        ),
                        MyText(formatDateTime(state.ad.date)),
                        Divider(
                          color: Colors.blueGrey.shade100,
                          thickness: 0.5,
                        ),
                        MyText("tavsif", fontWeight: FontWeight.w500),
                        MyText(state.ad.description),
                        Divider(
                          color: Colors.blueGrey.shade100,
                          thickness: 0.5,
                        ),
                        Row(
                          children: [
                            CircleAvatar(),
                            10.width,
                            MyText("kimdir"),
                            Spacer(),
                            Icon(Icons.star, color: Colors.amber),
                            MyText("4.8"),
                          ],
                        ),
                        Divider(
                          color: Colors.blueGrey.shade100,
                          thickness: 0.5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Text("obbo");
      },
    );
  }
}
