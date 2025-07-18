import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final Widget child;
  const BottomNav({super.key, required this.child});

int _calculateIndex(String location) {
  if (location.startsWith('/favorite')) return 1;
  if (location.startsWith('/create')) return 2;
  if (location.startsWith('/ads')) return 3;
  if (location.startsWith('/profile')) return 4;
  return 0;
}


  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _calculateIndex(location);

    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey.shade100.withValues(alpha: 0.2),
            border: Border.all(
              color: Colors.blueGrey.shade100.withValues(alpha: 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavIcon(
                  context,
                  icon: Icons.home,
                  index: 0,
                  currentIndex: currentIndex,
                  path: '/',
                ),
                _buildNavIcon(
                  context,
                  icon: Icons.favorite,
                  index: 1,
                  currentIndex: currentIndex,
                  path: '/favorite',
                ),
                _buildNavIcon(
                  context,
                  icon: Icons.add,
                  index: 2,
                  currentIndex: currentIndex,
                  path: '/create',
                ),
                _buildNavIcon(
                  context,
                  icon: Icons.assignment_outlined,
                  index: 3,
                  currentIndex: currentIndex,
                  path: '/ads',
                ),
                _buildNavIcon(
                  context,
                  icon: Icons.person,
                  index: 4,
                  currentIndex: currentIndex,
                  path: '/profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildNavIcon(
  BuildContext context, {
  required IconData icon,
  required int index,
  required int currentIndex,
  required String path,
}) {
  final isSelected = index == currentIndex;
  return IconButton(
    onPressed: () => context.go(path),
    icon: Icon(
      icon,
      color: isSelected ? Colors.black : Colors.grey,
      size: isSelected ? 28 : 24,
    ),
  );
}
