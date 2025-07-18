import 'package:ebozor/core/di/injection.dart' as di;
import 'package:ebozor/core/routes/app_router.dart';
import 'package:ebozor/feature/home/presentation/bloc/ad_detail_bloc/ad_detail_bloc.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc/ads_home_bloc.dart';
import 'package:ebozor/feature/create/presentation/bloc/ad_create_bloc.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc/ads_home_event.dart';
import 'package:ebozor/feature/my_ads/presentation/bloc/my_ads_bloc.dart';
import 'package:ebozor/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AdsHomeBloc(di.sl())..add(LoadAdsHomeEvent()),
        ),
        BlocProvider(create: (_) => AdCreateBloc(di.sl())),
        BlocProvider(create: (_) => MyAdsBloc(di.sl())),
        BlocProvider(create: (_) => AdDetailBloc(di.sl())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
