import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:ecommerce_app/features/products/domain/entities/category.dart';
import 'package:ecommerce_app/features/products/presentation/screens/category_products_screen.dart';
import 'package:ecommerce_app/features/products/presentation/screens/main_screen.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_app/features/splash_screen/presentation/screens/slpash_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder: (context) => const SlpashScreen(),
        );

      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );

      case AppRoutes.main:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );

      case AppRoutes.productDetails:
        final args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(id: args),
        );

      case AppRoutes.catProducts:
        final args = settings.arguments as Category;
        return MaterialPageRoute(
          builder: (context) => CategoryProductsScreen(category: args),
        );
      default:
        return null;
    }
  }
}
