import 'package:ecommerce_app/core/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/features/auth/presentation/screens/profile_screen.dart';

import 'package:ecommerce_app/features/products/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/products/presentation/screens/shop_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> screens = const [
    HomeScreen(),
    ShopScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<GlobalProvider>(context).index;
    return Scaffold(
      key: _scaffoldKey,
      body: screens[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(15)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          iconSize: 30.r,
          onTap: (value) => Provider.of<GlobalProvider>(context, listen: false)
              .changeIndex(value),
          items: [
            BottomNavigationBarItem(
                icon:
                    Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(currentIndex == 1
                    ? Icons.shopping_cart_rounded
                    : Icons.shopping_cart_outlined),
                label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(currentIndex == 2
                    ? Icons.shopping_bag_rounded
                    : Icons.shopping_bag_outlined),
                label: 'Bag'),
            BottomNavigationBarItem(
                icon: Icon(currentIndex == 3
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline),
                label: 'Favorits'),
            BottomNavigationBarItem(
                icon: Icon(
                    currentIndex == 4 ? Icons.person : Icons.person_outline),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
