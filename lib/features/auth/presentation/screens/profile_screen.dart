import '../../../../core/common/app_routes.dart';
import '../../../../core/constants/app_strings.dart';

import '../../../../core/providers/global_provider.dart';
import '../blocs/auth/auth_cubit.dart';
import '../widgets/profile_screen/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/profile_screen/image_and_name_section.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': AppStrings.myOrders,
        'onTap': () =>
            Navigator.pushNamed(context, AppRoutes.shippingAddresses),
      },
      {
        'title': AppStrings.shippingAddresses,
        'onTap': () =>
            Navigator.pushNamed(context, AppRoutes.shippingAddresses),
      },
      {
        'title': AppStrings.paymentMethods,
        'onTap': () =>
            Navigator.pushNamed(context, AppRoutes.shippingAddresses),
      },
      {
        'title': AppStrings.promocodes,
        'onTap': () =>
            Navigator.pushNamed(context, AppRoutes.shippingAddresses),
      },
      {
        'title': AppStrings.myReviews,
        'onTap': () =>
            Navigator.pushNamed(context, AppRoutes.shippingAddresses),
      },
      {
        'title': AppStrings.settings,
        'onTap': () =>
            Navigator.pushNamed(context, AppRoutes.shippingAddresses),
      },
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
                      title: items[index]['title'],
                      subTitle: '',
                      onTap: items[index]['onTap'],
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
