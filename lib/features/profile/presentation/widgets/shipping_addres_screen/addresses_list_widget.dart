import 'package:ecommerce_app/core/common/app_assets.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/empty_state_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/shipping_addres_screen/address_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AddressesListWidget extends StatelessWidget {
  const AddressesListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final List<Widget> addressesWidgets = [];
        final addresses = BlocProvider.of<AuthCubit>(context).user.addresses;
        addresses.forEach(
          (key, value) {
            addressesWidgets.add(
              AddressCardWidget(
                addressKey: key,
                addressData: value as Map<String, dynamic>,
                chooseDefault: true,
                isDismissable: true,
              ),
            );
          },
        );
        return SingleChildScrollView(
          child: addressesWidgets.isNotEmpty
              ? AnimationLimiter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                          childAnimationBuilder: (child) => ScaleAnimation(
                                child: FadeInAnimation(
                                  child: child,
                                ),
                              ),
                          children: addressesWidgets),
                    ),
                  ),
                )
              : EmptyStateWidget(
                  imgPath: AppAssets.noResults,
                  title: AppStrings.noAddressesTitle,
                  discription: AppStrings.noAddressesDisc,
                ),
        );
      },
    );
  }
}
