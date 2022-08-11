import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';

abstract class AppRemoteDataSource extends BaseRemoteDataSource {
  Future<void> updateCurrentLocation({
    required double longitude,
    required double latitude,
    required String token,
  });
}
