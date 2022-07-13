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
  Future<Either<Failure, void>> changeAvailabilityStatus() async {
    try {
      final token = await _local.token;
      await _http.changeAvailabilityStatus(token: token);
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }
}
