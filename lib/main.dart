import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/app_router.dart';
import 'package:ecommerce_app/core/common/app_themes.dart';
import 'package:ecommerce_app/core/helpers/cache_helper.dart';
import 'package:ecommerce_app/core/providers/global_provider.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';

import 'package:ecommerce_app/service_locator.dart' as di;

import 'features/products/presentation/blocs/products_cubit/products_cubit.dart';

void main() async {
  di.init();
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
            create: (context) => di.sl<AuthCubit>()..checkAuthToken(),
          ),
          BlocProvider<ProductsCubit>(
            create: (context) => di.sl<ProductsCubit>()..initData(),
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
