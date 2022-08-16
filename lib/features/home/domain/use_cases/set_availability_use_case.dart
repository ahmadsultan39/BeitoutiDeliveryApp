import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class SetAvailabilityUseCase
    implements UseCase<void, ParamsSetAvailabilityUseCase> {
  final HomeRepository _repository;

  SetAvailabilityUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(
      ParamsSetAvailabilityUseCase params) async {
    return await _repository.setAvailabilityStatus(
      params.status,
    );
  }
}

class ParamsSetAvailabilityUseCase extends Equatable {
  final bool status;

  const ParamsSetAvailabilityUseCase(this.status);

  @override
  List<Object?> get props => [status];
}
