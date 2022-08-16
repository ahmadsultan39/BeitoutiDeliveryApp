import 'package:beitouti_delivery/core/data/base_remote_datasource.dart';

abstract class HomeRemoteDataSource extends BaseRemoteDataSource {
  Future<void> changeAvailability({
    required String token,
  });
}
