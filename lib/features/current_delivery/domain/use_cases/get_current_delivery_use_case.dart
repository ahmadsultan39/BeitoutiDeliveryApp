import 'package:beitouti_delivery/features/current_delivery/domain/entities/current_delivery.dart';
import 'package:beitouti_delivery/features/current_delivery/domain/repositories/current_delivery_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetCurrentDeliveryUseCase implements UseCase<CurrentDelivery?, NoParams> {
  final CurrentDeliveryRepository _repository;

  GetCurrentDeliveryUseCase(this._repository);

  @override
  Future<Either<Failure, CurrentDelivery?>> call(NoParams params) {
    return _repository.getCurrentDelivery();
  }
}
