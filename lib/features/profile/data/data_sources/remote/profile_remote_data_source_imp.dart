import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';
import 'package:beitouti_delivery/core/network/models/paginate_response_model.dart';
import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:beitouti_delivery/features/profile/data/models/delivery_balance_model.dart';
import 'package:beitouti_delivery/features/profile/data/models/order_history_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImp({
    required Dio dio,
  }) : super(dio: dio);

  @override
  Future<DeliveryBalanceModel?> getDeliveryBalance({
    required String token,
  }) =>
      performGetRequest<DeliveryBalanceModel>(
        endpoint: Endpoints.getBalance,
        token: token,
      );

  @override
  Future<PaginateResponseModel<OrderHistoryModel>> getOrdersHistory({
    required String token,
    required int page,
  }) =>
      performGetRequest<PaginateResponseModel<OrderHistoryModel>>(
        endpoint: Endpoints.getOrderHistory(page),
        token: token,
      );

  @override
  Future<void> logout({
    required String token,
  }) async =>
      await performDeleteRequest<Null>(
        endpoint: Endpoints.logout,
        options: GetOptions.getOptionsWithToken(token),
      );
}
