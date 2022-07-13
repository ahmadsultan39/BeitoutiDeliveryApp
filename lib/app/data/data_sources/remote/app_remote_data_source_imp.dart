import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';
import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'app_remote_data_source.dart';

@LazySingleton(as: AppRemoteDataSource)
class AppRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements AppRemoteDataSource {
  AppRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<void> updateCurrentLocation({
    required double longitude,
    required double latitude,
    required String token,
  }) async =>
      await performPostRequest<Null>(
          endpoint: Endpoints.updateCurrentLocation,
          options: GetOptions.getOptionsWithToken(token),
          data: FormData.fromMap(
            {
              'current_longitude': longitude,
              'current_latitude': latitude,
            },
          ),
          queryParams: {
            "_method": "PUT",
          },
      );
}
