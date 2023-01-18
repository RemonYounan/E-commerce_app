import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/common/app_themes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';

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
      AppStrings.myOrders,
      AppStrings.shippingAddresses,
      AppStrings.paymentMethods,
      AppStrings.promocodes,
      AppStrings.myReviews,
      AppStrings.settings,
    ];
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 100.h,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.05,
                titlePadding: EdgeInsets.only(left: 14.w),
                title: Text(
                  AppStrings.myProfile,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: const ImageAndNameSection(),
                  ),
                  SizedBox(height: 20.h),
                  ...List.generate(
                    items.length,
                    (index) => ProfileItemWidget(
                      title: items[index],
                      subTitle: '',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        Text(AppStrings.darkMode),
                        Switch(
                          value: Provider.of<GlobalProvider>(context).isDark,
                          onChanged: (value) => Provider.of<GlobalProvider>(
                                  context,
                                  listen: false)
                              .changeThemeMode(value),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRoutes.signUp, (route) => false);
                            BlocProvider.of<AuthCubit>(context).logout();
                          },
                          child: Text(AppStrings.logout),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
