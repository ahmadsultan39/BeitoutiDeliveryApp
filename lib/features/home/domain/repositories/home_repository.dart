import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:beitouti_delivery/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository extends BaseRepository {
  Future<Either<Failure, void>> changeAvailabilityStatus();
}
