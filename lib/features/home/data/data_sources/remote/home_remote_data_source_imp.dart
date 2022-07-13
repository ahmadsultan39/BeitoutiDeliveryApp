import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';
import 'package:beitouti_delivery/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/util/constants.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements HomeRemoteDataSource {
  HomeRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<void> changeAvailabilityStatus({
    required String token,
  }) async =>
      await performPostRequest(
        endpoint: Endpoints.changeAvailabilityStatus,
        data: null,
        options: GetOptions.getOptionsWithToken(token),
        queryParams: {
          "_method": "PUT",
        },
      );
}
