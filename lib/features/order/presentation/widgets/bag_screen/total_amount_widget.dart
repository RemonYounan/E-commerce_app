import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../blocs/cart/cart_cubit.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.totalAmount,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDark),
        ),
        const Spacer(),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoadedState) {
              final totalAmount = state.cart.totalAmount.toInt();
              return Text(
                '$totalAmount\$',
                style: Theme.of(context).textTheme.headlineSmall,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      ],
    );
  }
}
