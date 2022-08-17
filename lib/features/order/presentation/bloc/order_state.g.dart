// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderState extends OrderState {
  @override
  final bool isLoading;
  @override
  final String message;
  @override
  final bool error;
  @override
  final Order? order;

  factory _$OrderState([void Function(OrderStateBuilder)? updates]) =>
      (new OrderStateBuilder()..update(updates))._build();

  _$OrderState._(
      {required this.isLoading,
      required this.message,
      required this.error,
      this.order})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'OrderState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(message, r'OrderState', 'message');
    BuiltValueNullFieldError.checkNotNull(error, r'OrderState', 'error');
  }

  @override
  OrderState rebuild(void Function(OrderStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderStateBuilder toBuilder() => new OrderStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderState &&
        isLoading == other.isLoading &&
        message == other.message &&
        error == other.error &&
        order == other.order;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), message.hashCode), error.hashCode),
        order.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderState')
          ..add('isLoading', isLoading)
          ..add('message', message)
          ..add('error', error)
          ..add('order', order))
        .toString();
  }
}

class OrderStateBuilder implements Builder<OrderState, OrderStateBuilder> {
  _$OrderState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  Order? _order;
  Order? get order => _$this._order;
  set order(Order? order) => _$this._order = order;

  OrderStateBuilder();

  OrderStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _message = $v.message;
      _error = $v.error;
      _order = $v.order;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderState;
  }

  @override
  void update(void Function(OrderStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderState build() => _build();

  _$OrderState _build() {
    final _$result = _$v ??
        new _$OrderState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'OrderState', 'isLoading'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'OrderState', 'message'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'OrderState', 'error'),
            order: order);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
