import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainView({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "diary"),
        ],
        onTap: navigationShell.goBranch,
      ),
    );
  }
}
