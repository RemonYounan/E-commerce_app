import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_routes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/utils/custom_text_button.dart';
import '../../../../auth/presentation/blocs/auth/auth_cubit.dart';
import '../../../../profile/presentation/widgets/shipping_addres_screen/address_card_widget.dart';
import '../../../../profile/presentation/widgets/shipping_addres_screen/no_addresses_widget.dart';

class DefaultAddressWidget extends StatelessWidget {
  const DefaultAddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final address = BlocProvider.of<AuthCubit>(context).user.addresses;
        final defaultAddresse =
            BlocProvider.of<AuthCubit>(context).user.defaultAddresse;
        return address.isNotEmpty
            ? AddressCardWidget(
                addressKey: defaultAddresse,
                addressData: address[defaultAddresse],
                title: AppStrings.change,
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.shippingAddresses),
              )
            : SizedBox(
                height: 150.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const NoAddressesWidget(),
                    CustomTextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        AppRoutes.addShippingAddress,
                      ),
                      title: AppStrings.addShippingAddress,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
