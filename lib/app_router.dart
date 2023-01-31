import 'package:ecommerce_app/features/profile/presentation/screens/add_shipping_address_screen.dart';
import 'package:ecommerce_app/features/profile/presentation/screens/payment_methods_screen.dart';
import 'package:ecommerce_app/features/profile/presentation/screens/shipping_address_screen.dart';
import 'package:ecommerce_app/features/order/presentation/screens/check_out_screen.dart';
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
          type: PageTransitionType.fade,
          child: const SignUpScreen(),
        );

      case AppRoutes.login:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const LoginScreen(),
        );

      case AppRoutes.forgotPassword:
        return PageTransition(
          type: PageTransitionType.fade,
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

      case AppRoutes.checkOut:
        return PageTransition(
          type: PageTransitionType.scale,
          alignment: Alignment.center,
          curve: Curves.ease,
          child: const CheckOutScreen(),
        );

      case AppRoutes.shippingAddresses:
        return PageTransition(
          type: PageTransitionType.scale,
          alignment: Alignment.topRight,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          child: const ShippingAddressScreen(),
        );

      case AppRoutes.addShippingAddress:
        final address = settings.arguments as Map<String, dynamic>?;
        return PageTransition(
          type: PageTransitionType.scale,
          alignment: Alignment.topRight,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          child: AddShippingAddressScreen(address: address),
        );
      case AppRoutes.payments:
        return PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.topRight,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            child: const PaymentMethodsScreen());
      default:
        return null;
    }
  }
}
