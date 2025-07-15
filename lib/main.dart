import 'package:ebozor/core/di/injection.dart' as di;
import 'package:ebozor/core/routes/app_router.dart';
import 'package:ebozor/feature/create/presentation/bloc/ad_create_bloc.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc.dart';
import 'package:ebozor/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AdCreateBloc(di.sl())),
              BlocProvider(create: (context) => AdsBloc(di.sl())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
