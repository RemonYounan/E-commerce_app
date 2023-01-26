import 'package:ecommerce_app/features/order/presentation/blocs/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
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
              SliverAppBar(
                pinned: true,
                expandedHeight: 100.h,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.05,
                  titlePadding: EdgeInsets.only(left: 14.w, bottom: 5.h),
                  title: Text(
                    AppStrings.myBag,
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
                delegate: SliverChildListDelegate(
                  [
                    const CartListWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state.cart.products!.isNotEmpty) {
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
