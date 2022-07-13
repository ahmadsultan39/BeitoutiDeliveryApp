import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:beitouti_delivery/core/error/failures.dart';
import 'package:beitouti_delivery/features/current_delivery/domain/entities/current_delivery.dart';
import 'package:dartz/dartz.dart';

abstract class CurrentDeliveryRepository extends BaseRepository {
  Future<Either<Failure, CurrentDelivery>> getCurrentDelivery();
}
