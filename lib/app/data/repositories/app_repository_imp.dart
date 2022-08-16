import 'package:beitouti_delivery/app/data/data_sources/local/app_local_data_source.dart';
import 'package:beitouti_delivery/app/data/data_sources/remote/app_remote_data_source.dart';
import 'package:beitouti_delivery/app/domain/repositories/app_repository.dart';
import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:beitouti_delivery/core/error/failures.dart';
import 'package:beitouti_delivery/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pusher_client/pusher_client.dart';

import '../../../core/util/constants.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImp extends BaseRepositoryImpl implements AppRepository {
  final AppLocalDataSource _local;
  final AppRemoteDataSource _http;

  AppRepositoryImp(
    this._local,
    this._http, {
    required BaseLocalDataSource baseLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: baseLocalDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, void>> updateCurrentLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final token = await _local.token;
      await _http.updateCurrentLocation(
        longitude: longitude,
        latitude: latitude,
        token: token,
      );

      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PusherOptions>> getPusherOptions() async {
    try {
      final PusherOptions options = PusherOptions(
        host: Endpoints.socketUrl,
      );
      return Right(options);
    } catch (e) {
      throw const Left(PusherOptionsFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getUserId() async {
    try {
      final userId = await _local.userId;
      return Right(userId);
    } catch (e) {
      throw const Left(CacheFailure());
    }
  }
}
