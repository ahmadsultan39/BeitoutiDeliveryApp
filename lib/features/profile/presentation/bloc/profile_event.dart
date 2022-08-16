import 'package:built_value/built_value.dart';

part 'profile_event.g.dart';

abstract class ProfileEvent {}

/// Logout
abstract class Logout extends ProfileEvent
    implements Built<Logout, LogoutBuilder> {
  //getter fields

  Logout._();

  factory Logout([Function(LogoutBuilder b) updates]) = _$Logout;

  factory Logout.initial() {
    return Logout((b) => b);
  }
}


/// SetLogoutValue
abstract class SetLogoutValue extends ProfileEvent
    implements Built<SetLogoutValue, SetLogoutValueBuilder> {
  //getter fields

  SetLogoutValue._();

  factory SetLogoutValue([Function(SetLogoutValueBuilder b) updates]) = _$SetLogoutValue;

  factory SetLogoutValue.initial() {
    return SetLogoutValue((b) => b);
  }
}

/// GetChefBalance
abstract class GetBalance extends ProfileEvent
    implements Built<GetBalance, GetBalanceBuilder> {
  //getter fields

  GetBalance._();

  factory GetBalance([Function(GetBalanceBuilder b) updates]) =
      _$GetBalance;

  factory GetBalance.initial() {
    return GetBalance((b) => b);
  }
}

/// GetOrdersHistory
abstract class GetOrdersHistory extends ProfileEvent
    implements Built<GetOrdersHistory, GetOrdersHistoryBuilder> {
  //getter fields

  int get page;

  GetOrdersHistory._();

  factory GetOrdersHistory([Function(GetOrdersHistoryBuilder b) updates]) =
      _$GetOrdersHistory;

  factory GetOrdersHistory.initial() {
    return GetOrdersHistory((b) => b);
  }
}

abstract class ClearMessage extends ProfileEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  //getter fields

  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
      _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}
