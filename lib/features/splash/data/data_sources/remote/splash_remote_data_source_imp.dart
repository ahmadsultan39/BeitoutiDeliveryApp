import 'package:beitouti_delivery/features/splash/data/data_sources/remote/splash_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/base_remote_datasource.dart';

@LazySingleton(as: SplashRemoteDataSource)
class SplashRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements SplashRemoteDataSource {
  SplashRemoteDataSourceImp({
    required Dio dio,
  }) : super(dio: dio);
}
