import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:beitouti_delivery/core/error/exceptions.dart';
import 'package:beitouti_delivery/core/error/failures.dart';
import 'package:beitouti_delivery/core/network/network_info.dart';
import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:beitouti_delivery/features/order/data/data_sources/local/order_local_data_source.dart';
import 'package:beitouti_delivery/features/order/data/data_sources/remote/order_remote_data_source.dart';
import 'package:beitouti_delivery/features/order/domain/repositories/order_repository.dart';
import 'package:beitouti_delivery/core/entities/order.dart' as order;
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImp extends BaseRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _http;
  final OrderLocalDataSource _local;

  OrderRepositoryImp(
    this._http,
    this._local, {
    required BaseLocalDataSource baseLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: baseLocalDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, void>> changeOrderStatus({
    required int orderId,
    required OrderStatus newStatus,
  }) async {
    try {
      final token = await _local.token;
      await _http.changeOrderStatus(
        token: token,
        orderId: orderId,
        newStatus: newStatus,
      );
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, order.Order?>> getOrder({
    required int orderId,
  }) async {
    try {
      final token = await _local.token;
      final order = await _http.getOrder(
        token: token,
        orderId: orderId,
      );
      return Right(order);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> reportOrder({
    required String reason,
    required String reportedOn,
    required int orderId,
  }) async {
    try {
      final token = await _local.token;
      await _http.reportOrder(
        token: token,
        orderId: orderId,
        reportedOn: reportedOn,
        reason: reason,
      );
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }
}
