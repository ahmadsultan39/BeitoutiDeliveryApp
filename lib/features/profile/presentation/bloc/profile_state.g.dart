// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileState extends ProfileState {
  @override
  final String message;
  @override
  final bool error;
  @override
  final bool isLoading;
  @override
  final bool isLoggedOut;
  @override
  final DeliveryBalance? balance;
  @override
  final PaginationStateData<OrderHistory> orderHistory;

  factory _$ProfileState([void Function(ProfileStateBuilder)? updates]) =>
      (new ProfileStateBuilder()..update(updates))._build();

  _$ProfileState._(
      {required this.message,
      required this.error,
      required this.isLoading,
      required this.isLoggedOut,
      this.balance,
      required this.orderHistory})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(message, r'ProfileState', 'message');
    BuiltValueNullFieldError.checkNotNull(error, r'ProfileState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ProfileState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isLoggedOut, r'ProfileState', 'isLoggedOut');
    BuiltValueNullFieldError.checkNotNull(
        orderHistory, r'ProfileState', 'orderHistory');
  }

  @override
  ProfileState rebuild(void Function(ProfileStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileStateBuilder toBuilder() => new ProfileStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileState &&
        message == other.message &&
        error == other.error &&
        isLoading == other.isLoading &&
        isLoggedOut == other.isLoggedOut &&
        balance == other.balance &&
        orderHistory == other.orderHistory;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, message.hashCode), error.hashCode),
                    isLoading.hashCode),
                isLoggedOut.hashCode),
            balance.hashCode),
        orderHistory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileState')
          ..add('message', message)
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('isLoggedOut', isLoggedOut)
          ..add('balance', balance)
          ..add('orderHistory', orderHistory))
        .toString();
  }
}

class ProfileStateBuilder
    implements Builder<ProfileState, ProfileStateBuilder> {
  _$ProfileState? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isLoggedOut;
  bool? get isLoggedOut => _$this._isLoggedOut;
  set isLoggedOut(bool? isLoggedOut) => _$this._isLoggedOut = isLoggedOut;

  DeliveryBalance? _balance;
  DeliveryBalance? get balance => _$this._balance;
  set balance(DeliveryBalance? balance) => _$this._balance = balance;

  PaginationStateDataBuilder<OrderHistory>? _orderHistory;
  PaginationStateDataBuilder<OrderHistory> get orderHistory =>
      _$this._orderHistory ??= new PaginationStateDataBuilder<OrderHistory>();
  set orderHistory(PaginationStateDataBuilder<OrderHistory>? orderHistory) =>
      _$this._orderHistory = orderHistory;

  ProfileStateBuilder();

  ProfileStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _error = $v.error;
      _isLoading = $v.isLoading;
      _isLoggedOut = $v.isLoggedOut;
      _balance = $v.balance;
      _orderHistory = $v.orderHistory.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileState;
  }

  @override
  void update(void Function(ProfileStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileState build() => _build();

  _$ProfileState _build() {
    _$ProfileState _$result;
    try {
      _$result = _$v ??
          new _$ProfileState._(
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'ProfileState', 'message'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'ProfileState', 'error'),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'ProfileState', 'isLoading'),
              isLoggedOut: BuiltValueNullFieldError.checkNotNull(
                  isLoggedOut, r'ProfileState', 'isLoggedOut'),
              balance: balance,
              orderHistory: orderHistory.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orderHistory';
        orderHistory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProfileState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
