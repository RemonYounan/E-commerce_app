import 'package:ecommerce_app/core/utils/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/order/order_cubit.dart';

import '../widgets/my_orders_screen/orders_list_widget.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    super.initState();
    getOrders();
  }

  void getOrders() {
    final id = BlocProvider.of<AuthCubit>(context).user.id;
    BlocProvider.of<OrderCubit>(context).getOrders(id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.myOrders),
          actions: [
            IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              ),
              icon: const Icon(Icons.search),
            )
          ],
          bottom: TabBar(
            splashBorderRadius: BorderRadius.circular(29),
            dividerColor: Colors.transparent,
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: 11.w, vertical: 7.h),
            tabs: [
              Tab(
                child: Text(AppStrings.deliverd),
              ),
              Tab(
                child: Text(AppStrings.processing),
              ),
              Tab(
                child: Text(AppStrings.cancelled),
              ),
            ],
          ),
        ),
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoadedState) {
              return TabBarView(
                children: <Widget>[
                  OrdersListWidget(orders: state.completedOrders),
                  OrdersListWidget(orders: state.pendingOrders),
                  OrdersListWidget(orders: state.cancelledOrders),
                ],
              );
            } else if (state is OrderLoadingState) {
              return const LoadingWidget();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
