import 'package:animations/animations.dart';
import 'package:ecommerce_app/core/common/app_colors.dart';
import 'package:ecommerce_app/core/common/app_routes.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/providers/global_provider.dart';
import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/core/utils/toast.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/order/order_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/screens/order_placed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SubmitOrderButton extends StatelessWidget {
  const SubmitOrderButton({
    super.key,
  });

  void submit(BuildContext context) {
    final id = BlocProvider.of<AuthCubit>(context).user.id;
    final address = BlocProvider.of<AuthCubit>(context).getDefaultAddress();
    final cartProducts = BlocProvider.of<CartCubit>(context).cart.products;
    BlocProvider.of<OrderCubit>(context).createorder(id, address, cartProducts);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return OpenContainer(
      openElevation: 0,
      closedElevation: 0,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      openBuilder: (context, action) => const OrderPlacedScreen(),
      closedBuilder: (context, action) => CustomButton(
        onPressed: () => submit(context),
        child: BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state is OrderPlacedState) {
              BlocProvider.of<CartCubit>(context).clearCart();
              Provider.of<GlobalProvider>(context, listen: false)
                  .changeIndex(0);
              action();
            } else if (state is OrderErrorState) {
              fToast.init(context);
              showToast(
                  context: context,
                  title: state.message,
                  color:
                      isDark ? AppColors.errorColorDark : AppColors.errorColor);
            }
          },
          builder: (context, state) {
            if (state is OrderLoadingState) {
              return LoadingWidget(
                  color: isDark ? AppColors.whiteDark : AppColors.white);
            } else {
              return Text(AppStrings.submitOrder);
            }
          },
        ),
      ),
    );
  }
}
