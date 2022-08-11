import 'package:beitouti_delivery/core/entities/order.dart';
import 'package:built_value/built_value.dart';

part 'order_state.g.dart';

abstract class OrderState implements Built<OrderState, OrderStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;

  Order? get order;

  OrderState._();

  factory OrderState([Function(OrderStateBuilder b) updates]) = _$OrderState;

  factory OrderState.initial() {
    return OrderState(
      (b) => b
        ..isLoading = false
        ..message = ""
        ..error = false,
    );
  }
}
