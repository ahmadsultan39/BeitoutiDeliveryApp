import 'package:beitouti_delivery/features/order/domain/repositories/order_repository.dart';
import 'package:beitouti_delivery/core/entities/order.dart' as order;
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class ReportOrderUseCase implements UseCase<void, ParamsReportOrderUseCase> {
  final OrderRepository _repository;

  ReportOrderUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ParamsReportOrderUseCase params) {
    return _repository.reportOrder(
      orderId: params.orderId,
      reason: params.reason,
      reportedOn: params.reportedOn,
    );
  }
}

class ParamsReportOrderUseCase extends Equatable {
  final String reason;
  final String reportedOn;
  final int orderId;

  const ParamsReportOrderUseCase({
    required this.orderId,
    required this.reason,
    required this.reportedOn,
  });

  @override
  List<Object?> get props => [orderId, reason, reportedOn];
}
