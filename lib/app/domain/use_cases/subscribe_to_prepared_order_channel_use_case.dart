import 'package:beitouti_delivery/app/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class UpdateCurrentLocationUseCase
    implements UseCase<void, ParamsUpdateCurrentLocationUseCase> {
  final AppRepository _repository;

  UpdateCurrentLocationUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(
      ParamsUpdateCurrentLocationUseCase params) {
    return _repository.updateCurrentLocation(
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class ParamsUpdateCurrentLocationUseCase extends Equatable {
  final double latitude;
  final double longitude;

  const ParamsUpdateCurrentLocationUseCase({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [longitude, latitude];
}
