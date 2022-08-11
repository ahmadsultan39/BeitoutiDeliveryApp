import 'package:beitouti_delivery/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class ChangeAvailabilityStatusUseCase implements UseCase<void, NoParams> {
  final HomeRepository _repository;

  ChangeAvailabilityStatusUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _repository.changeAvailabilityStatus();
  }
}
