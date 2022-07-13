// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthState extends AuthState {
  @override
  final bool isLoading;
  @override
  final String message;
  @override
  final bool error;
  @override
  final bool isCodeSent;
  @override
  final bool isCodeValid;
  @override
  final bool isRegisterRequestSent;
  @override
  final User? user;
  @override
  final AccessibilityStaysType? accessibilityStaysType;

  factory _$AuthState([void Function(AuthStateBuilder)? updates]) =>
      (new AuthStateBuilder()..update(updates))._build();

  _$AuthState._(
      {required this.isLoading,
      required this.message,
      required this.error,
      required this.isCodeSent,
      required this.isCodeValid,
      required this.isRegisterRequestSent,
      this.user,
      this.accessibilityStaysType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, 'AuthState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(message, 'AuthState', 'message');
    BuiltValueNullFieldError.checkNotNull(error, 'AuthState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        isCodeSent, 'AuthState', 'isCodeSent');
    BuiltValueNullFieldError.checkNotNull(
        isCodeValid, 'AuthState', 'isCodeValid');
    BuiltValueNullFieldError.checkNotNull(
        isRegisterRequestSent, 'AuthState', 'isRegisterRequestSent');
  }

  @override
  AuthState rebuild(void Function(AuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        isLoading == other.isLoading &&
        message == other.message &&
        error == other.error &&
        isCodeSent == other.isCodeSent &&
        isCodeValid == other.isCodeValid &&
        isRegisterRequestSent == other.isRegisterRequestSent &&
        user == other.user &&
        accessibilityStaysType == other.accessibilityStaysType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, isLoading.hashCode), message.hashCode),
                            error.hashCode),
                        isCodeSent.hashCode),
                    isCodeValid.hashCode),
                isRegisterRequestSent.hashCode),
            user.hashCode),
        accessibilityStaysType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthState')
          ..add('isLoading', isLoading)
          ..add('message', message)
          ..add('error', error)
          ..add('isCodeSent', isCodeSent)
          ..add('isCodeValid', isCodeValid)
          ..add('isRegisterRequestSent', isRegisterRequestSent)
          ..add('user', user)
          ..add('accessibilityStaysType', accessibilityStaysType))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  bool? _isCodeSent;
  bool? get isCodeSent => _$this._isCodeSent;
  set isCodeSent(bool? isCodeSent) => _$this._isCodeSent = isCodeSent;

  bool? _isCodeValid;
  bool? get isCodeValid => _$this._isCodeValid;
  set isCodeValid(bool? isCodeValid) => _$this._isCodeValid = isCodeValid;

  bool? _isRegisterRequestSent;
  bool? get isRegisterRequestSent => _$this._isRegisterRequestSent;
  set isRegisterRequestSent(bool? isRegisterRequestSent) =>
      _$this._isRegisterRequestSent = isRegisterRequestSent;

  User? _user;
  User? get user => _$this._user;
  set user(User? user) => _$this._user = user;

  AccessibilityStaysType? _accessibilityStaysType;
  AccessibilityStaysType? get accessibilityStaysType =>
      _$this._accessibilityStaysType;
  set accessibilityStaysType(AccessibilityStaysType? accessibilityStaysType) =>
      _$this._accessibilityStaysType = accessibilityStaysType;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _message = $v.message;
      _error = $v.error;
      _isCodeSent = $v.isCodeSent;
      _isCodeValid = $v.isCodeValid;
      _isRegisterRequestSent = $v.isRegisterRequestSent;
      _user = $v.user;
      _accessibilityStaysType = $v.accessibilityStaysType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthState;
  }

  @override
  void update(void Function(AuthStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthState build() => _build();

  _$AuthState _build() {
    final _$result = _$v ??
        new _$AuthState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, 'AuthState', 'isLoading'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'AuthState', 'message'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, 'AuthState', 'error'),
            isCodeSent: BuiltValueNullFieldError.checkNotNull(
                isCodeSent, 'AuthState', 'isCodeSent'),
            isCodeValid: BuiltValueNullFieldError.checkNotNull(
                isCodeValid, 'AuthState', 'isCodeValid'),
            isRegisterRequestSent: BuiltValueNullFieldError.checkNotNull(
                isRegisterRequestSent, 'AuthState', 'isRegisterRequestSent'),
            user: user,
            accessibilityStaysType: accessibilityStaysType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
