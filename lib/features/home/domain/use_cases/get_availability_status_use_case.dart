import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class GetAvailabilityStatusUseCase implements UseCase<bool, NoParams> {
  final HomeRepository _repository;

  GetAvailabilityStatusUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.getAvailabilityStatus();
  }
}
