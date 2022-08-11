import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:beitouti_delivery/core/error/failures.dart';
import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:beitouti_delivery/core/entities/order.dart' as order;

import 'package:dartz/dartz.dart';

abstract class OrderRepository extends BaseRepository {
  Future<Either<Failure, order.Order>> getOrder({
    required int orderId,
  });

  Future<Either<Failure, void>> changeOrderStatus({
    required int orderId,
    required OrderStatus newStatus,
  });

  Future<Either<Failure, void>> reportOrder({
    required String reason,
    required String reportedOn,
    required int orderId,
  });
}
