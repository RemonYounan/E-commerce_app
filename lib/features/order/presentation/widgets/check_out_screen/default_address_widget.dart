import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/app_routes.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../auth/presentation/blocs/auth/auth_cubit.dart';
import '../../../../profile/presentation/widgets/shipping_addres_screen/address_card_widget.dart';

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
            : const SizedBox.shrink();
      },
    );
  }
}
