import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_event.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_state.dart';
import 'package:ebozor/feature/home/presentation/widgets/home_widget/home_appbar.dart';
import 'package:ebozor/feature/home/presentation/widgets/home_widget/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              HomeAppbar(),
              SectionHeader(title: "Yangi"),
              
            ],
          ),
        ),
      ),
    );
  }
}










class AdssScreen extends StatefulWidget {
  const AdssScreen({super.key});

  @override
  State<AdssScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdssScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdsBloc>().add(LoadAdsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E'lonlar")),
      body: BlocBuilder<AdsBloc, AdsState>(
        builder: (context, state) {
          if (state is AdsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AdsLoaded) {
            if (state.ads.isEmpty) {
              return const Center(child: Text("E'lonlar yo'q"));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.ads.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final ad = state.ads[i];
                return Card(
                  child: ListTile(
                    leading: ad.image.isNotEmpty
                        ? Image.network(ad.image, width: 56, height: 56, fit: BoxFit.cover)
                        : const Icon(Icons.image, size: 56),
                    title: Text(ad.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(ad.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                    trailing: Text("${ad.price.toStringAsFixed(0)} UZS"),
                  ),
                );
              },
            );
          } else if (state is AdsFailure) {
            return Center(child: Text("Xatolik: ${state.message}"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}