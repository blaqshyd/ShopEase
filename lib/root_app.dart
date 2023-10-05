import 'package:flutter/material.dart';
import 'package:river_state/common/app_colors.dart';
import 'package:river_state/features/product/presentation/product_list_screen.dart';
import 'package:river_state/features/users/presentation/user_lists_screen.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final List<Widget> _pages = [
    const UserListScreen(),
    const ProductListScreen(),
    const Center(child: Text('data')),
    const Center(child: Text('data')),
  ];

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feeds'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.chat_rounded),
      label: 'Messeage',
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
            backgroundColor: AppColor.black6,
            fixedColor: AppColor.black9,
            type: BottomNavigationBarType.fixed,
            items: items,
            currentIndex: selectedIndex,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            }),
      ),
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
