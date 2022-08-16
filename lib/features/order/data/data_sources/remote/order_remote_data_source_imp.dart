import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';
import 'package:beitouti_delivery/core/models/order_model.dart';
import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:beitouti_delivery/features/order/data/data_sources/remote/order_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements OrderRemoteDataSource {
  OrderRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<void> changeOrderStatus({
    required String token,
    required int orderId,
    required OrderStatus newStatus,
  }) async =>
      await performPostRequest<Null>(
        endpoint: Endpoints.changeOrderStatus(orderId),
        options: GetOptions.getOptionsWithToken(token),
        data: RequestBody.changeOrderStatus(newStatus: newStatus),
        queryParams: {
          "_method": "PUT",
        },
      );

  @override
  Future<OrderModel?> getOrder({
    required String token,
    required int orderId,
  }) async =>
      await performGetRequest<OrderModel>(
        endpoint: Endpoints.getOrder(orderId),
        token: token,
      );

  @override
  Future<void> reportOrder({
    required String token,
    required int orderId,
    required String reason,
    required String reportedOn,
  }) async =>
      await performPostRequest<Null>(
        endpoint: Endpoints.reportOrder(orderId),
        options: GetOptions.getOptionsWithToken(token),
        data: RequestBody.reportOrder(reason: reason, reportedOn: reportedOn),
      );
}
