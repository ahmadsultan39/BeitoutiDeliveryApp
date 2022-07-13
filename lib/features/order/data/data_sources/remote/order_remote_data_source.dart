import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';
import 'package:beitouti_delivery/core/models/order_model.dart';
import 'package:beitouti_delivery/core/util/enums.dart';

abstract class OrderRemoteDataSource extends BaseRemoteDataSource {
  Future<OrderModel> getOrder({
    required String token,
    required int orderId,
  });

  Future<void> changeOrderStatus({
    required String token,
    required int orderId,
    required OrderStatus newStatus,
  });

  Future<void> reportOrder({
    required String token,
    required int orderId,
    required String reason,
    required String reportedOn,
  });
}
