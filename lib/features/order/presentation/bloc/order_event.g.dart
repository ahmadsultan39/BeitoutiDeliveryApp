// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeOrderStatus extends ChangeOrderStatus {
  @override
  final int orderId;
  @override
  final OrderStatus newStatus;

  factory _$ChangeOrderStatus(
          [void Function(ChangeOrderStatusBuilder)? updates]) =>
      (new ChangeOrderStatusBuilder()..update(updates))._build();

  _$ChangeOrderStatus._({required this.orderId, required this.newStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        orderId, 'ChangeOrderStatus', 'orderId');
    BuiltValueNullFieldError.checkNotNull(
        newStatus, 'ChangeOrderStatus', 'newStatus');
  }

  @override
  ChangeOrderStatus rebuild(void Function(ChangeOrderStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeOrderStatusBuilder toBuilder() =>
      new ChangeOrderStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeOrderStatus &&
        orderId == other.orderId &&
        newStatus == other.newStatus;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, orderId.hashCode), newStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangeOrderStatus')
          ..add('orderId', orderId)
          ..add('newStatus', newStatus))
        .toString();
  }
}

class ChangeOrderStatusBuilder
    implements Builder<ChangeOrderStatus, ChangeOrderStatusBuilder> {
  _$ChangeOrderStatus? _$v;

  int? _orderId;
  int? get orderId => _$this._orderId;
  set orderId(int? orderId) => _$this._orderId = orderId;

  OrderStatus? _newStatus;
  OrderStatus? get newStatus => _$this._newStatus;
  set newStatus(OrderStatus? newStatus) => _$this._newStatus = newStatus;

  ChangeOrderStatusBuilder();

  ChangeOrderStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderId = $v.orderId;
      _newStatus = $v.newStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeOrderStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeOrderStatus;
  }

  @override
  void update(void Function(ChangeOrderStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeOrderStatus build() => _build();

  _$ChangeOrderStatus _build() {
    final _$result = _$v ??
        new _$ChangeOrderStatus._(
            orderId: BuiltValueNullFieldError.checkNotNull(
                orderId, 'ChangeOrderStatus', 'orderId'),
            newStatus: BuiltValueNullFieldError.checkNotNull(
                newStatus, 'ChangeOrderStatus', 'newStatus'));
    replace(_$result);
    return _$result;
  }
}

class _$GetOrder extends GetOrder {
  @override
  final int orderId;

  factory _$GetOrder([void Function(GetOrderBuilder)? updates]) =>
      (new GetOrderBuilder()..update(updates))._build();

  _$GetOrder._({required this.orderId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(orderId, 'GetOrder', 'orderId');
  }

  @override
  GetOrder rebuild(void Function(GetOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrderBuilder toBuilder() => new GetOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrder && orderId == other.orderId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, orderId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetOrder')..add('orderId', orderId))
        .toString();
  }
}

class GetOrderBuilder implements Builder<GetOrder, GetOrderBuilder> {
  _$GetOrder? _$v;

  int? _orderId;
  int? get orderId => _$this._orderId;
  set orderId(int? orderId) => _$this._orderId = orderId;

  GetOrderBuilder();

  GetOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderId = $v.orderId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrder;
  }

  @override
  void update(void Function(GetOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrder build() => _build();

  _$GetOrder _build() {
    final _$result = _$v ??
        new _$GetOrder._(
            orderId: BuiltValueNullFieldError.checkNotNull(
                orderId, 'GetOrder', 'orderId'));
    replace(_$result);
    return _$result;
  }
}

class _$ReportOrder extends ReportOrder {
  @override
  final String reason;
  @override
  final String reportedOn;
  @override
  final int orderId;

  factory _$ReportOrder([void Function(ReportOrderBuilder)? updates]) =>
      (new ReportOrderBuilder()..update(updates))._build();

  _$ReportOrder._(
      {required this.reason, required this.reportedOn, required this.orderId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(reason, 'ReportOrder', 'reason');
    BuiltValueNullFieldError.checkNotNull(
        reportedOn, 'ReportOrder', 'reportedOn');
    BuiltValueNullFieldError.checkNotNull(orderId, 'ReportOrder', 'orderId');
  }

  @override
  ReportOrder rebuild(void Function(ReportOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportOrderBuilder toBuilder() => new ReportOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportOrder &&
        reason == other.reason &&
        reportedOn == other.reportedOn &&
        orderId == other.orderId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, reason.hashCode), reportedOn.hashCode), orderId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReportOrder')
          ..add('reason', reason)
          ..add('reportedOn', reportedOn)
          ..add('orderId', orderId))
        .toString();
  }
}

class ReportOrderBuilder implements Builder<ReportOrder, ReportOrderBuilder> {
  _$ReportOrder? _$v;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _reportedOn;
  String? get reportedOn => _$this._reportedOn;
  set reportedOn(String? reportedOn) => _$this._reportedOn = reportedOn;

  int? _orderId;
  int? get orderId => _$this._orderId;
  set orderId(int? orderId) => _$this._orderId = orderId;

  ReportOrderBuilder();

  ReportOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reason = $v.reason;
      _reportedOn = $v.reportedOn;
      _orderId = $v.orderId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportOrder;
  }

  @override
  void update(void Function(ReportOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportOrder build() => _build();

  _$ReportOrder _build() {
    final _$result = _$v ??
        new _$ReportOrder._(
            reason: BuiltValueNullFieldError.checkNotNull(
                reason, 'ReportOrder', 'reason'),
            reportedOn: BuiltValueNullFieldError.checkNotNull(
                reportedOn, 'ReportOrder', 'reportedOn'),
            orderId: BuiltValueNullFieldError.checkNotNull(
                orderId, 'ReportOrder', 'orderId'));
    replace(_$result);
    return _$result;
  }
}

class _$ClearMessage extends ClearMessage {
  factory _$ClearMessage([void Function(ClearMessageBuilder)? updates]) =>
      (new ClearMessageBuilder()..update(updates))._build();

  _$ClearMessage._() : super._();

  @override
  ClearMessage rebuild(void Function(ClearMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearMessageBuilder toBuilder() => new ClearMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearMessage;
  }

  @override
  int get hashCode {
    return 147402354;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ClearMessage').toString();
  }
}

class ClearMessageBuilder
    implements Builder<ClearMessage, ClearMessageBuilder> {
  _$ClearMessage? _$v;

  ClearMessageBuilder();

  @override
  void replace(ClearMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearMessage;
  }

  @override
  void update(void Function(ClearMessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearMessage build() => _build();

  _$ClearMessage _build() {
    final _$result = _$v ?? new _$ClearMessage._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
