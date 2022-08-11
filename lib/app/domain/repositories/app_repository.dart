import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:pusher_client/pusher_client.dart';
import '../../../core/error/failures.dart';

abstract class AppRepository extends BaseRepository {
  Future<Either<Failure, void>> updateCurrentLocation({
    required double latitude,
    required double longitude,
  });

  Future<Either<Failure, PusherOptions>> getPusherOptions();

  Future<Either<Failure, int>> getUserId();
}
