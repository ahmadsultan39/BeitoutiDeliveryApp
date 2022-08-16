import 'package:beitouti_delivery/features/profile/domain/entities/delivery_balance.dart';
import 'package:beitouti_delivery/features/profile/domain/entities/order_history.dart';
import 'package:built_value/built_value.dart';

import '../../../../core/entities/pagination_state_data.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  String get message;

  bool get error;

  bool get isLoading;

  bool get isLoggedOut;

  DeliveryBalance? get balance;

  PaginationStateData<OrderHistory> get orderHistory;

  ProfileState._();

  factory ProfileState([Function(ProfileStateBuilder b) updates]) =
      _$ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
      (b) => b
        ..isLoading = false
        ..message = ""
        ..isLoggedOut = false
        ..error = false
        ..balance = null
        ..orderHistory.replace(PaginationStateData<OrderHistory>.initial()),
    );
  }
}
