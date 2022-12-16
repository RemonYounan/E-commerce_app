import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/common/app_themes.dart';

import 'package:ecommerce_app/core/providers/global_provider.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/profile_screen/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/features/auth/presentation/widgets/profile_screen/image_and_name_section.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = [
      'my_orders'.tr(),
      'shipping_addresses'.tr(),
      'payment_methods'.tr(),
      'promocodes'.tr(),
      'my_reviews'.tr(),
      'settings'.tr(),
    ];
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          children: [
            Text(
              'my_profile'.tr(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 20.h,
            ),
            const ImageAndNameSection(),
            SizedBox(
              height: 20.h,
            ),
            ...List.generate(
              items.length,
              (index) => ProfileItemWidget(
                title: items[index],
                subTitle: '',
              ),
            ),
            Row(
              children: [
                const Text('Dark mode'),
                Switch(
                  value: Provider.of<GlobalProvider>(context).isDark,
                  onChanged: (value) =>
                      Provider.of<GlobalProvider>(context, listen: false)
                          .changeThemeMode(value),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.signUp, (route) => false);
                    BlocProvider.of<AuthCubit>(context).logout();
                  },
                  child: const Text('Log out'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
