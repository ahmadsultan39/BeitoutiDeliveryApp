import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:beitouti_delivery/features/profile/domain/entities/delivery_balance.dart';
import 'package:beitouti_delivery/features/profile/domain/entities/order_history.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/paginate_list.dart';
import '../../../../core/error/failures.dart';

abstract class ProfileRepository extends BaseRepository {
  Future<Either<Failure, DeliveryBalance?>> getDeliveryBalance();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, PaginateList<OrderHistory>>> getOrdersHistory(
      int page);
}
