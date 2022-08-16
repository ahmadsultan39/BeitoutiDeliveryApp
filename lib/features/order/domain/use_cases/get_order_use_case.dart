import 'package:beitouti_delivery/features/order/domain/repositories/order_repository.dart';
import 'package:beitouti_delivery/core/entities/order.dart' as order;
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetOrderUseCase implements UseCase<order.Order?, ParamsGetOrderUseCase> {
  final OrderRepository _repository;

  GetOrderUseCase(this._repository);

  @override
  Future<Either<Failure, order.Order?>> call(ParamsGetOrderUseCase params) {
    return _repository.getOrder(orderId: params.orderId);
  }
}

class ParamsGetOrderUseCase extends Equatable {
  final int orderId;

  const ParamsGetOrderUseCase({required this.orderId});

  @override
  List<Object?> get props => [orderId];
}
