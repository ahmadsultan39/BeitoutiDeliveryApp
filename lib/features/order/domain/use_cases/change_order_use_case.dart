import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:beitouti_delivery/features/order/domain/repositories/order_repository.dart';
import 'package:beitouti_delivery/core/entities/order.dart' as order;
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class ChangeOrderStatusUseCase implements UseCase<void, ParamsChangeOrderStatusUseCase> {
  final OrderRepository _repository;

  ChangeOrderStatusUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsChangeOrderStatusUseCase params) {
    return _repository.changeOrderStatus(
      orderId: params.orderId,
      newStatus: params.newStatus,
    );
  }
}

class ParamsChangeOrderStatusUseCase extends Equatable {
  final int orderId;
  final OrderStatus newStatus;

  const ParamsChangeOrderStatusUseCase({
    required this.orderId,
    required this.newStatus,
  });

  @override
  List<Object?> get props => [orderId, newStatus];
}
