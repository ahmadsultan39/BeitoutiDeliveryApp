import 'package:beitouti_delivery/features/current_delivery/domain/entities/current_delivery.dart';
import 'package:built_value/built_value.dart';

part 'current_delivery_state.g.dart';

abstract class CurrentDeliveryState
    implements Built<CurrentDeliveryState, CurrentDeliveryStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;

  CurrentDelivery? get currentDelivery;

  CurrentDeliveryState._();

  factory CurrentDeliveryState(
          [Function(CurrentDeliveryStateBuilder b) updates]) =
      _$CurrentDeliveryState;

  factory CurrentDeliveryState.initial() {
    return CurrentDeliveryState(
      (b) => b
        ..currentDelivery = null
        ..isLoading = false
        ..message = ""
        ..error = false,
    );
  }
}
