import 'package:beitouti_delivery/app/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetUserIdUseCase implements UseCase<int, NoParams> {
  final AppRepository _repository;

  GetUserIdUseCase(this._repository);

  @override
  Future<Either<Failure, int>> call(NoParams params) {
    return _repository.getUserId();
  }
}
