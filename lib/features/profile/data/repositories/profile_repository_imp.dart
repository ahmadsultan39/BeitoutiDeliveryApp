import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:beitouti_delivery/core/entities/paginate_list.dart';
import 'package:beitouti_delivery/core/error/exceptions.dart';
import 'package:beitouti_delivery/core/error/failures.dart';
import 'package:beitouti_delivery/core/network/network_info.dart';
import 'package:beitouti_delivery/features/profile/data/data_sources/local/profile_local_data_source.dart';
import 'package:beitouti_delivery/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:beitouti_delivery/features/profile/data/models/order_history_model.dart';
import 'package:beitouti_delivery/features/profile/domain/entities/delivery_balance.dart';
import 'package:beitouti_delivery/features/profile/domain/entities/order_history.dart';
import 'package:beitouti_delivery/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImp extends BaseRepositoryImpl
    implements ProfileRepository {
  final ProfileLocalDataSource _local;
  final ProfileRemoteDataSource _http;

  ProfileRepositoryImp(
    this._local,
    this._http, {
    required BaseLocalDataSource baseLocalDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: baseLocalDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, DeliveryBalance?>> getDeliveryBalance() async {
    try {
      final token = await _local.token;
      final result = await _http.getDeliveryBalance(token: token);
      return Right(result);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, PaginateList<OrderHistory>>> getOrdersHistory(
      int page) async {
    try {
      final token = await _local.token;
      final result = await _http.getOrdersHistory(token: token, page: page);
      final List<OrderHistory> list = [];
      for (OrderHistoryModel model in result.data) {
        list.add(
          OrderHistory(
            id: model.id,
            mealsQuantity: model.mealsQuantity,
            totalCost: model.totalCost,
            deliveryCost: model.deliveryCost,
            chefLocation: model.chefLocation,
            chefName: model.chefName,
            destination: model.destination,
            deliveredAt: model.deliveredAt,
          ),
        );
      }

      return Right(
        PaginateList(
          total: result.total,
          pages: result.numPages,
          data: list,
        ),
      );
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final token = await _local.token;
      await _http.logout(token: token);
      await _local.logout();
      return const Right(null);
    } on HandledException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }
}
