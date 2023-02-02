import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/core/utils/loading_widget.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/order/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/order_details_screen/order_details_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderCubit>(context).getOrderDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.orderDetails),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoadedState) {
            final order =
                state.ordersDetails.firstWhere((e) => e.id == widget.id);
            return OrderDetailsWidget(order: order);
          } else if (state is OrderLoadingState) {
            return const LoadingWidget();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
