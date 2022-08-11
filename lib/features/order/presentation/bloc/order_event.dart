import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:built_value/built_value.dart';

part 'order_event.g.dart';

abstract class OrderEvent {}

abstract class ChangeOrderStatus extends OrderEvent
    implements Built<ChangeOrderStatus, ChangeOrderStatusBuilder> {
  //getter fields

  int get orderId;

  OrderStatus get newStatus;

  ChangeOrderStatus._();

  factory ChangeOrderStatus([Function(ChangeOrderStatusBuilder b) updates]) =
      _$ChangeOrderStatus;

  factory ChangeOrderStatus.initial() {
    return ChangeOrderStatus((b) => b);
  }
}

abstract class GetOrder extends OrderEvent
    implements Built<GetOrder, GetOrderBuilder> {
  //getter fields

  int get orderId;

  GetOrder._();

  factory GetOrder([Function(GetOrderBuilder b) updates]) = _$GetOrder;

  factory GetOrder.initial() {
    return GetOrder((b) => b);
  }
}

abstract class ReportOrder extends OrderEvent
    implements Built<ReportOrder, ReportOrderBuilder> {
  //getter fields

  String get reason;

  String get reportedOn;

  int get orderId;

  ReportOrder._();

  factory ReportOrder([Function(ReportOrderBuilder b) updates]) = _$ReportOrder;

  factory ReportOrder.initial() {
    return ReportOrder((b) => b);
  }
}

abstract class ClearMessage extends OrderEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
  _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}

