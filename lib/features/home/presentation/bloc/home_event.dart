import 'package:built_value/built_value.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class ChangeAvailabilityStatus extends HomeEvent
    implements
        Built<ChangeAvailabilityStatus, ChangeAvailabilityStatusBuilder> {
  //getter fields

  ChangeAvailabilityStatus._();

  factory ChangeAvailabilityStatus(
          [Function(ChangeAvailabilityStatusBuilder b) updates]) =
      _$ChangeAvailabilityStatus;

  factory ChangeAvailabilityStatus.initial() {
    return ChangeAvailabilityStatus((b) => b);
  }
}

abstract class ClearMessage extends HomeEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
      _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}
