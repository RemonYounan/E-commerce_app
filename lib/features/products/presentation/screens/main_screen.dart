import 'package:animations/animations.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/providers/global_provider.dart';
import '../../../order/presentation/screens/bag_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';
import 'shop_screen.dart';

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
    BagScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    DateTime lastTimeBackbuttonWasClicked = DateTime.now();
    final currentIndex = Provider.of<GlobalProvider>(context).index;
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) return true;
        if (DateTime.now().difference(lastTimeBackbuttonWasClicked) >=
            const Duration(seconds: 2)) {
          fToast.init(context);
          showToast(
            context: context,
            title: 'Press the back button again to go back',
          );

          lastTimeBackbuttonWasClicked = DateTime.now();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.scaled,
            fillColor: Colors.transparent,
            child: child,
          ),
          child: screens[currentIndex],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(15)),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            iconSize: 30.r,
            onTap: (value) {
              Provider.of<GlobalProvider>(context, listen: false)
                  .changeIndex(value);
              if (value == 3) {
                final id = BlocProvider.of<AuthCubit>(context).user.id;
                BlocProvider.of<ProductsCubit>(context).getFavProducts(id);
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home_outlined),
                  activeIcon: const Icon(Icons.home),
                  label: AppStrings.home),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  activeIcon: const Icon(Icons.shopping_cart_rounded),
                  label: AppStrings.shop),
              BottomNavigationBarItem(
                  icon: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state is CartLoadedState) {
                        return Badge(
                          label: Text(state.cart.products.length.toString()),
                          textStyle: AppTextStyle.helperTextStyle1(context),
                          child: Icon(currentIndex == 2
                              ? Icons.shopping_bag_rounded
                              : Icons.shopping_bag_outlined),
                        );
                      } else {
                        return Icon(currentIndex == 2
                            ? Icons.shopping_bag_rounded
                            : Icons.shopping_bag_outlined);
                      }
                    },
                  ),
                  label: AppStrings.bag),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite_outline),
                  activeIcon: const Icon(Icons.favorite_rounded),
                  label: AppStrings.favorits),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person_outline),
                  activeIcon: const Icon(Icons.person),
                  label: AppStrings.profile),
            ],
          ),
        ),
      ),
    );
  }
}
