import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:beitouti_delivery/core/error/exceptions.dart';
import 'package:beitouti_delivery/core/error/failures.dart';
import 'package:beitouti_delivery/core/network/network_info.dart';
import 'package:beitouti_delivery/features/current_delivery/data/data_sources/local/current_delivery_local_data_source.dart';
import 'package:beitouti_delivery/features/current_delivery/data/data_sources/remote/current_delivery_remote_data_source.dart';
import 'package:beitouti_delivery/features/current_delivery/domain/entities/current_delivery.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/current_delivery_repository.dart';

@LazySingleton(as: CurrentDeliveryRepository)
class CurrentDeliveryRepositoryImp extends BaseRepositoryImpl
    implements CurrentDeliveryRepository {
  final CurrentDeliveryLocalDataSource _local;
  final CurrentDeliveryRemoteDataSource _http;

  CurrentDeliveryRepositoryImp(
    this._local,
    this._http, {
    required BaseLocalDataSource baseLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: baseLocalDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, CurrentDelivery?>> getCurrentDelivery() async {
    try {
      final token = await _local.token;
      final currentDelivery = await _http.getCurrentDelivery(token: token);
      return Right(currentDelivery);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }
}
