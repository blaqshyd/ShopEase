import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_ease/common/app_colors.dart';
import 'package:shop_ease/features/home/views/home.dart';
import 'package:shop_ease/features/profile/profile_screen.dart';
import 'package:shop_ease/features/users/presentation/user_lists_screen.dart';
import 'package:shop_ease/features/wishlist/wishlist_screen.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

int sIdx = 0;
List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon:
        sIdx == 1 ? const Icon(IconlyBold.home) : const Icon(IconlyLight.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: sIdx == 1
        ? const Icon(IconlyBold.heart)
        : const Icon(IconlyLight.heart),
    label: 'Wishlist',
  ),
  BottomNavigationBarItem(
    icon: sIdx == 2
        ? const Icon(IconlyBold.paper)
        : const Icon(IconlyLight.paper),
    label: 'History',
  ),
  BottomNavigationBarItem(
      icon: sIdx == 3
          ? const Icon(IconlyBold.profile)
          : const Icon(IconlyLight.profile),
      label: 'Profile'),
];

final List<Widget> _pages = [
  const Home(),
  const WishlistScreen(),
  const UserListScreen(),
  const ProfileScreen()
];

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
            backgroundColor: AppColor.background,
            // fixedColor: AppColor.black9,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.dGreenDarkActive,
            items: items,
            currentIndex: sIdx,
            onTap: (value) => setState(
                  () => sIdx = value,
                )),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(4),
            child: IndexedStack(
              index: sIdx,
              children: _pages,
            )),
      ),
    );
  }
}
