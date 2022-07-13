// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_delivery_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CurrentDeliveryState extends CurrentDeliveryState {
  @override
  final bool isLoading;
  @override
  final String message;
  @override
  final bool error;
  @override
  final CurrentDelivery? currentDelivery;

  factory _$CurrentDeliveryState(
          [void Function(CurrentDeliveryStateBuilder)? updates]) =>
      (new CurrentDeliveryStateBuilder()..update(updates))._build();

  _$CurrentDeliveryState._(
      {required this.isLoading,
      required this.message,
      required this.error,
      this.currentDelivery})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'CurrentDeliveryState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        message, 'CurrentDeliveryState', 'message');
    BuiltValueNullFieldError.checkNotNull(
        error, 'CurrentDeliveryState', 'error');
  }

  @override
  CurrentDeliveryState rebuild(
          void Function(CurrentDeliveryStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrentDeliveryStateBuilder toBuilder() =>
      new CurrentDeliveryStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CurrentDeliveryState &&
        isLoading == other.isLoading &&
        message == other.message &&
        error == other.error &&
        currentDelivery == other.currentDelivery;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), message.hashCode), error.hashCode),
        currentDelivery.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CurrentDeliveryState')
          ..add('isLoading', isLoading)
          ..add('message', message)
          ..add('error', error)
          ..add('currentDelivery', currentDelivery))
        .toString();
  }
}

class CurrentDeliveryStateBuilder
    implements Builder<CurrentDeliveryState, CurrentDeliveryStateBuilder> {
  _$CurrentDeliveryState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  CurrentDelivery? _currentDelivery;
  CurrentDelivery? get currentDelivery => _$this._currentDelivery;
  set currentDelivery(CurrentDelivery? currentDelivery) =>
      _$this._currentDelivery = currentDelivery;

  CurrentDeliveryStateBuilder();

  CurrentDeliveryStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _message = $v.message;
      _error = $v.error;
      _currentDelivery = $v.currentDelivery;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CurrentDeliveryState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CurrentDeliveryState;
  }

  @override
  void update(void Function(CurrentDeliveryStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CurrentDeliveryState build() => _build();

  _$CurrentDeliveryState _build() {
    final _$result = _$v ??
        new _$CurrentDeliveryState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, 'CurrentDeliveryState', 'isLoading'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'CurrentDeliveryState', 'message'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, 'CurrentDeliveryState', 'error'),
            currentDelivery: currentDelivery);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
