import 'package:beitouti_delivery/core/data/base_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class SplashRepository extends BaseRepository {
  Future<Either<Failure, bool>> checkAuth();
}
