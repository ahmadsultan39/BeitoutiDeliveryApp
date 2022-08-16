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
  Future<void> changeAvailability({
    required String token,
  }) =>
      performPostRequest<Null>(
        endpoint: Endpoints.changeAvailabilityStatus,
        options: GetOptions.getOptionsWithToken(token),
        queryParams: {
          '_method': 'PUT',
        },
      );
}
