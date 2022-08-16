import 'package:beitouti_delivery/features/profile/domain/entities/order_history.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/paginate_list.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/params/paginate_list_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class GetOrdersHistoryUseCase
    implements UseCase<PaginateList<OrderHistory>, PaginateListParams> {
  final ProfileRepository _repository;

  GetOrdersHistoryUseCase(this._repository);

  @override
  Future<Either<Failure, PaginateList<OrderHistory>>> call(
    PaginateListParams params,
  ) {
    return _repository.getOrdersHistory(params.page);
  }
}
