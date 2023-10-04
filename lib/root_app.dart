import 'package:flutter/material.dart';
import 'package:river_state/features/users_list/presentation/user_lists_screen.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final List<Widget> _pages = [
    const UserListScreen(),
    const Center(
      child: Text('data'),
    )
  ];

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feeds'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              value = selectedIndex;
            });
          }),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: IndexedStack(
              index: selectedIndex,
              children: _pages,
            )),
      ),
    );
  }
}
