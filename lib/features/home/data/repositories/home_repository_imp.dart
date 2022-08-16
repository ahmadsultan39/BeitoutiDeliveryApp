import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:beitouti_delivery/core/error/exceptions.dart';
import 'package:beitouti_delivery/core/error/failures.dart';
import 'package:beitouti_delivery/core/network/network_info.dart';
import 'package:beitouti_delivery/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:beitouti_delivery/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:beitouti_delivery/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImp extends BaseRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _http;
  final HomeLocalDataSource _local;

  HomeRepositoryImp(
    this._http,
    this._local, {
    required BaseLocalDataSource baseLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: baseLocalDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, void>> changeAvailability(bool currentStatus) async {
    try {
      final token = await _local.token;
      await _http.changeAvailability(token: token);
      await baseLocalDataSource.setStatus(!currentStatus);
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, bool>> getAvailabilityStatus() async {
    try {
      final status = baseLocalDataSource.status;
      print(status);
      print('*****************************************');
      return Right(status);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setAvailabilityStatus(bool status) async {
    try {
      await baseLocalDataSource.setStatus(status);
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }
}
