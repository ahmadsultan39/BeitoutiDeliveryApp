import 'package:beitouti_delivery/app/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pusher_client/pusher_client.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetPusherOptionsUseCase implements UseCase<PusherOptions, NoParams> {
  final AppRepository _repository;

  GetPusherOptionsUseCase(this._repository);

  @override
  Future<Either<Failure, PusherOptions>> call(NoParams params) {
    return _repository.getPusherOptions();
  }
}
