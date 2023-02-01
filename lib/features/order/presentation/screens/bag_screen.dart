import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/order/presentation/blocs/cart/cart_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/widgets/bag_screen/bag_screen_appbar_widget.dart';

import '../widgets/bag_screen/cart_list_widget.dart';
import '../widgets/bag_screen/check_out_widget.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const BagScreenAppbarWidget(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [const CartListWidget()],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoadedState) {
              return const CheckOutWidget();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
