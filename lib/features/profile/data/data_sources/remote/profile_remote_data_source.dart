import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';
import 'package:beitouti_delivery/core/network/models/paginate_response_model.dart';
import 'package:beitouti_delivery/features/profile/data/models/delivery_balance_model.dart';
import 'package:beitouti_delivery/features/profile/data/models/order_history_model.dart';

abstract class ProfileRemoteDataSource extends BaseRemoteDataSource {
  Future<DeliveryBalanceModel?> getDeliveryBalance({
    required String token,
  });

  Future<PaginateResponseModel<OrderHistoryModel>> getOrdersHistory({
    required String token,
    required int page,
  });

  Future<void> logout({
    required String token,
  });
}
