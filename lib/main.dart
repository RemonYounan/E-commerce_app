import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/order/order_cubit.dart';
import 'features/order/presentation/blocs/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';
import 'core/common/app_themes.dart';
import 'core/helpers/cache_helper.dart';
import 'core/providers/global_provider.dart';
import 'features/auth/presentation/blocs/auth/auth_cubit.dart';

import 'service_locator.dart' as di;

import 'core/helpers/bloc_observer.dart';
import 'features/products/presentation/blocs/products_cubit/products_cubit.dart';

void main() async {
  di.init();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: ChangeNotifierProvider(
        create: (context) => di.sl<GlobalProvider>()..getCachedTheme(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => di.sl<AuthCubit>(),
          ),
          BlocProvider<ProductsCubit>(
            create: (context) => di.sl<ProductsCubit>()..initData(),
          ),
          BlocProvider<CartCubit>(
            create: (context) =>
                di.sl<CartCubit>()..getCartFromSharedPreference(),
          ),
          BlocProvider<OrderCubit>(
            create: (context) => di.sl<OrderCubit>(),
          ),
        ],
        child: MaterialApp(
          title: 'Ecommerce App',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: Provider.of<GlobalProvider>(context).themeMode,
          theme: AppThemes.getLightAppTheme(),
          darkTheme: AppThemes.getDarkAppTheme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
