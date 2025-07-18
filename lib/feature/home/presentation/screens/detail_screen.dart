import 'package:ebozor/feature/home/presentation/bloc/ad_detail_bloc/ad_detail_bloc.dart';
import 'package:ebozor/feature/home/presentation/bloc/ad_detail_bloc/ad_detail_event.dart';
import 'package:ebozor/feature/home/presentation/widgets/detail_widget/detail_ad_view.dart';
import 'package:ebozor/feature/home/presentation/widgets/detail_widget/detail_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdDetailBloc>().add(LoadAdByIdEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(children: [DetailAdView()])),

      bottomNavigationBar: DetailBottomBar(),
    );
  }
}
