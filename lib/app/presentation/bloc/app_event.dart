import 'package:built_value/built_value.dart';

part 'app_event.g.dart';

abstract class AppEvent {}

abstract class SubscribeToOrderIsAssignedChannel extends AppEvent
    implements
        Built<SubscribeToOrderIsAssignedChannel,
            SubscribeToOrderIsAssignedChannelBuilder> {
  //getter fields

  SubscribeToOrderIsAssignedChannel._();

  factory SubscribeToOrderIsAssignedChannel(
          [Function(SubscribeToOrderIsAssignedChannelBuilder b) updates]) =
      _$SubscribeToOrderIsAssignedChannel;

  factory SubscribeToOrderIsAssignedChannel.initial() {
    return SubscribeToOrderIsAssignedChannel((b) => b);
  }
}

abstract class SubscribeToOrderIsPreparedChannel extends AppEvent
    implements
        Built<SubscribeToOrderIsPreparedChannel,
            SubscribeToOrderIsPreparedChannelBuilder> {
  //getter fields

  SubscribeToOrderIsPreparedChannel._();

  factory SubscribeToOrderIsPreparedChannel(
          [Function(SubscribeToOrderIsPreparedChannelBuilder b) updates]) =
      _$SubscribeToOrderIsPreparedChannel;

  factory SubscribeToOrderIsPreparedChannel.initial() {
    return SubscribeToOrderIsPreparedChannel((b) => b);
  }
}

abstract class ClearMessage extends AppEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
      _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}
