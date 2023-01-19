import 'package:flutter/material.dart';

import 'core/common/app_routes.dart';
import 'features/auth/presentation/screens/forgot_password_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/signup_screen.dart';
import 'features/products/domain/entities/category.dart';
import 'features/products/presentation/screens/category_products_screen.dart';
import 'features/products/presentation/screens/main_screen.dart';
import 'features/products/presentation/screens/product_details_screen.dart';
import 'features/splash_screen/presentation/screens/slpash_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder: (context) => const SlpashScreen(),
        );

      case AppRoutes.signUp:
        return PageTransition(
          type: PageTransitionType.rightToLeftJoined,
          alignment: Alignment.centerRight,
          childCurrent: const SlpashScreen(),
          child: const SignUpScreen(),
        );

      case AppRoutes.login:
        return PageTransition(
          type: PageTransitionType.rightToLeftJoined,
          alignment: Alignment.centerRight,
          childCurrent: const SignUpScreen(),
          child: const LoginScreen(),
        );

      case AppRoutes.forgotPassword:
        return PageTransition(
          type: PageTransitionType.rightToLeftJoined,
          alignment: Alignment.centerRight,
          childCurrent: const LoginScreen(),
          child: const ForgotPasswordScreen(),
        );

      case AppRoutes.main:
        return PageTransition(
          type: PageTransitionType.leftToRight,
          curve: Curves.ease,
          child: const MainScreen(),
        );

      case AppRoutes.productDetails:
        final args = settings.arguments as Map<String, dynamic>;
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          curve: Curves.ease,
          child: ProductDetailsScreen(
            id: args['id'],
            product: args['product'],
            cartProduct: args['cartProduct'],
          ),
        );

      case AppRoutes.catProducts:
        final args = settings.arguments as Category;
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          curve: Curves.ease,
          child: CategoryProductsScreen(category: args),
        );
      default:
        return null;
    }
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute(
      {required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(position: animation.drive(tween), child: child);
  }
}
