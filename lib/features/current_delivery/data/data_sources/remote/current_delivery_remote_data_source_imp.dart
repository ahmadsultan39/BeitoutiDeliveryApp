import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';
import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/features/current_delivery/data/data_sources/remote/current_delivery_remote_data_source.dart';
import 'package:beitouti_delivery/features/current_delivery/data/models/current_delivery_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CurrentDeliveryRemoteDataSource)
class CurrentDeliveryRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements CurrentDeliveryRemoteDataSource {
  CurrentDeliveryRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<CurrentDeliveryModel> getCurrentDelivery({
    required String token,
  }) async =>
      await performGetRequest<CurrentDeliveryModel>(
        Endpoints.currentDelivery,
        token,
      );
}
