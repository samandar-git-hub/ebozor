import 'package:ebozor/core/routes/bottom_nav.dart';
import 'package:ebozor/feature/my_ads/presentation/screens/my_ads_screen.dart';
import 'package:ebozor/feature/create/presentation/screens/create_screen.dart';
import 'package:ebozor/feature/favorite/presentation/screens/favorite_screen.dart';
import 'package:ebozor/feature/home/presentation/screens/detail_screen.dart';
import 'package:ebozor/feature/home/presentation/screens/home_screen.dart';
import 'package:ebozor/feature/profile/presentation/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNav(child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeScreen()),
        GoRoute(
          path: '/favorite',
          builder: (context, state) => FavoriteScreen(),
        ),
        GoRoute(path: '/create', builder: (context, state) => CreateScreen()),
        GoRoute(path: '/ads', builder: (context, state) => MyAdsScreen()),
        GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
      ],
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => DetailScreen(id: state.extra as String),
    ),
  ],
);
