import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';
import 'package:beitouti_delivery/features/current_delivery/data/models/current_delivery_model.dart';

abstract class CurrentDeliveryRemoteDataSource extends BaseRemoteDataSource {
  Future<CurrentDeliveryModel?> getCurrentDelivery({
    required String token,
  });
}
