import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app_routes.dart';
import '../../../../core/common/app_text_styles.dart';
import '../../../../core/providers/global_provider.dart';
import '../../../auth/presentation/blocs/auth/auth_cubit.dart';
import '../../../order/presentation/blocs/cart/cart_cubit.dart';
import '../../../order/presentation/blocs/order/order_cubit.dart';
import '../../../products/presentation/blocs/products_cubit/products_cubit.dart';
import '../blocs/profile_cubit/profile_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings),
      ),
      body: Column(
        children: [
          ListTile(
            title: Row(
              children: [
                Text(
                  AppStrings.darkMode,
                  style: AppTextStyle.titleMediumTextStyle(context),
                ),
                const Spacer(),
                Switch(
                  inactiveTrackColor: AppColors.grey,
                  value: Provider.of<GlobalProvider>(context).isDark,
                  onChanged: (value) =>
                      Provider.of<GlobalProvider>(context, listen: false)
                          .changeThemeMode(value),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.signUp, (route) => false);
              BlocProvider.of<AuthCubit>(context).logout();
              BlocProvider.of<ProductsCubit>(context).clear();
              BlocProvider.of<CartCubit>(context).clearCart();
              BlocProvider.of<OrderCubit>(context).clear();
              BlocProvider.of<ProfileCubit>(context).clear();
            },
            title: Text(
              AppStrings.logout,
              style: AppTextStyle.titleMediumTextStyle(context),
            ),
            trailing: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
