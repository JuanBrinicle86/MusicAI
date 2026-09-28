import 'package:flutter/material.dart';

class MusicAiBottomNav extends StatelessWidget {
  const MusicAiBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    const items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.tune_outlined),
        activeIcon: Icon(Icons.tune),
        label: 'Afinador',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.smart_toy_outlined),
        activeIcon: Icon(Icons.smart_toy),
        label: 'IA MusicAI',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.emoji_events_outlined),
        activeIcon: Icon(Icons.emoji_events),
        label: 'Desafíos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.groups_outlined),
        activeIcon: Icon(Icons.groups),
        label: 'Comunidad',
      ),
    ];

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.surface,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
      showUnselectedLabels: true,
      elevation: 0,
      items: items,
    );
  }
}
