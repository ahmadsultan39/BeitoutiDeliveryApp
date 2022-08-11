import 'package:built_value/built_value.dart';

part 'current_delivery_event.g.dart';

abstract class CurrentDeliveryEvent {}

abstract class GetCurrentDelivery extends CurrentDeliveryEvent
    implements Built<GetCurrentDelivery, GetCurrentDeliveryBuilder> {
  //getter fields

  GetCurrentDelivery._();

  factory GetCurrentDelivery([Function(GetCurrentDeliveryBuilder b) updates]) =
      _$GetCurrentDelivery;

  factory GetCurrentDelivery.initial() {
    return GetCurrentDelivery((b) => b);
  }
}

abstract class ClearMessage extends CurrentDeliveryEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
      _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}
