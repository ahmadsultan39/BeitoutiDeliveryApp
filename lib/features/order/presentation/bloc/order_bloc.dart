import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:beitouti_delivery/features/order/domain/use_cases/change_order_use_case.dart';
import 'package:beitouti_delivery/features/order/domain/use_cases/get_order_use_case.dart';
import 'package:beitouti_delivery/features/order/domain/use_cases/report_order_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'order.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetOrderUseCase _getOrderUseCase;
  final ReportOrderUseCase _reportOrderUseCase;
  final ChangeOrderStatusUseCase _changeOrderStatusUseCase;

  void clearMessage() {
    add(ClearMessage());
  }

  void addGetOrderEvent({
    required int orderId,
  }) {
    add(GetOrder((b) => b..orderId = orderId));
  }

  void addReportOrderEvent({
    required int orderId,
    required String reason,
    required String reportedOn,
  }) {
    add(ReportOrder(
      (b) => b
        ..orderId = orderId
        ..reason = reason
        ..reportedOn = reportedOn,
    ));
  }

  void addChangeOrderStatusEvent({
    required int orderId,
    required OrderStatus newStatus,
  }) {
    add(ChangeOrderStatus(
      (b) => b
        ..orderId = orderId
        ..newStatus = newStatus,
    ));
  }

  @factoryMethod
  OrderBloc(
    this._getOrderUseCase,
    this._reportOrderUseCase,
    this._changeOrderStatusUseCase,
  ) : super(OrderState.initial()) {
    on<OrderEvent>(
      (event, emit) async {
        /*** ClearMessage ***/
        if (event is ClearMessage) {
          emit(
            state.rebuild(
              (b) => b
                ..error = false
                ..message = '',
            ),
          );
        }

        /*** GetOrder ***/
        if (event is GetOrder) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _getOrderUseCase(
            ParamsGetOrderUseCase(orderId: event.orderId),
          );

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..message = failure.error
                  ..error = true,
              ),
            ),
            (order) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..order = order,
              ),
            ),
          );
        }
        /*** ReportOrder ***/
        if (event is ReportOrder) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _reportOrderUseCase(
            ParamsReportOrderUseCase(
              orderId: event.orderId,
              reason: event.reason,
              reportedOn: event.reportedOn,
            ),
          );

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..message = failure.error
                  ..error = true,
              ),
            ),
            (success) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..message = 'تم الإبلاغ عن الطلب بنجاح',
              ),
            ),
          );
        }

        /*** ChangeOrderStatus ***/
        if (event is ChangeOrderStatus) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _changeOrderStatusUseCase(
            ParamsChangeOrderStatusUseCase(
              orderId: event.orderId,
              newStatus: event.newStatus,
            ),
          );

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..message = failure.error
                  ..error = true,
              ),
            ),
            (success) {
              emit(
                state.rebuild(
                  (b) => b..isLoading = false,
                ),
              );
              addGetOrderEvent(orderId: event.orderId);
            },
          );
        }
      },
    );
  }
}
