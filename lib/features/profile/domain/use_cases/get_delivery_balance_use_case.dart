import 'package:beitouti_delivery/features/profile/domain/entities/delivery_balance.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class GetDeliveryBalanceUseCase implements UseCase<DeliveryBalance?, NoParams> {
  final ProfileRepository _repository;

  GetDeliveryBalanceUseCase(this._repository);

  @override
  Future<Either<Failure, DeliveryBalance?>> call(NoParams params) {
    return _repository.getDeliveryBalance();
  }
}
