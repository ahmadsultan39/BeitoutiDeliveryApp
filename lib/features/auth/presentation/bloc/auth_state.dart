import 'package:built_value/built_value.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/user.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;

  bool get isCodeSent;

  bool get isCodeValid;

  bool get isRegisterRequestSent;

  User? get user;

  AccessibilityStaysType? get accessibilityStaysType;

  AuthState._();

  factory AuthState([Function(AuthStateBuilder b) updates]) = _$AuthState;

  factory AuthState.initial() {
    return AuthState(
          (b) => b
        ..isLoading = false
        ..user = null
        ..isRegisterRequestSent = false
        ..accessibilityStaysType = null
        ..isCodeSent = false
        ..isCodeValid = false
        ..message = ""
        ..error = false,
    );
  }
}
