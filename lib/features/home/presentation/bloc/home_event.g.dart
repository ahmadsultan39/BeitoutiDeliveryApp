// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeAvailabilityEvent extends ChangeAvailabilityEvent {
  factory _$ChangeAvailabilityEvent(
          [void Function(ChangeAvailabilityEventBuilder)? updates]) =>
      (new ChangeAvailabilityEventBuilder()..update(updates))._build();

  _$ChangeAvailabilityEvent._() : super._();

  @override
  ChangeAvailabilityEvent rebuild(
          void Function(ChangeAvailabilityEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeAvailabilityEventBuilder toBuilder() =>
      new ChangeAvailabilityEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeAvailabilityEvent;
  }

  @override
  int get hashCode {
    return 853716486;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ChangeAvailabilityEvent').toString();
  }
}

class ChangeAvailabilityEventBuilder
    implements
        Builder<ChangeAvailabilityEvent, ChangeAvailabilityEventBuilder> {
  _$ChangeAvailabilityEvent? _$v;

  ChangeAvailabilityEventBuilder();

  @override
  void replace(ChangeAvailabilityEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeAvailabilityEvent;
  }

  @override
  void update(void Function(ChangeAvailabilityEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeAvailabilityEvent build() => _build();

  _$ChangeAvailabilityEvent _build() {
    final _$result = _$v ?? new _$ChangeAvailabilityEvent._();
    replace(_$result);
    return _$result;
  }
}

class _$GetAvailabilityStatus extends GetAvailabilityStatus {
  factory _$GetAvailabilityStatus(
          [void Function(GetAvailabilityStatusBuilder)? updates]) =>
      (new GetAvailabilityStatusBuilder()..update(updates))._build();

  _$GetAvailabilityStatus._() : super._();

  @override
  GetAvailabilityStatus rebuild(
          void Function(GetAvailabilityStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAvailabilityStatusBuilder toBuilder() =>
      new GetAvailabilityStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAvailabilityStatus;
  }

  @override
  int get hashCode {
    return 43178691;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetAvailabilityStatus').toString();
  }
}

class GetAvailabilityStatusBuilder
    implements Builder<GetAvailabilityStatus, GetAvailabilityStatusBuilder> {
  _$GetAvailabilityStatus? _$v;

  GetAvailabilityStatusBuilder();

  @override
  void replace(GetAvailabilityStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAvailabilityStatus;
  }

  @override
  void update(void Function(GetAvailabilityStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAvailabilityStatus build() => _build();

  _$GetAvailabilityStatus _build() {
    final _$result = _$v ?? new _$GetAvailabilityStatus._();
    replace(_$result);
    return _$result;
  }
}

class _$SetAvailabilityStatus extends SetAvailabilityStatus {
  @override
  final bool status;

  factory _$SetAvailabilityStatus(
          [void Function(SetAvailabilityStatusBuilder)? updates]) =>
      (new SetAvailabilityStatusBuilder()..update(updates))._build();

  _$SetAvailabilityStatus._({required this.status}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        status, r'SetAvailabilityStatus', 'status');
  }

  @override
  SetAvailabilityStatus rebuild(
          void Function(SetAvailabilityStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetAvailabilityStatusBuilder toBuilder() =>
      new SetAvailabilityStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetAvailabilityStatus && status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetAvailabilityStatus')
          ..add('status', status))
        .toString();
  }
}

class SetAvailabilityStatusBuilder
    implements Builder<SetAvailabilityStatus, SetAvailabilityStatusBuilder> {
  _$SetAvailabilityStatus? _$v;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  SetAvailabilityStatusBuilder();

  SetAvailabilityStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetAvailabilityStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetAvailabilityStatus;
  }

  @override
  void update(void Function(SetAvailabilityStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetAvailabilityStatus build() => _build();

  _$SetAvailabilityStatus _build() {
    final _$result = _$v ??
        new _$SetAvailabilityStatus._(
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'SetAvailabilityStatus', 'status'));
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
    return newBuiltValueToStringHelper(r'ClearMessage').toString();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
