import 'package:ecommerce_app/features/order/data/data_source/order_remote_data_source.dart';
import 'package:ecommerce_app/features/order/domain/repositories/order_repository.dart';

class OrderRepositoyImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoyImpl(
    this.remoteDataSource,
  );

}
