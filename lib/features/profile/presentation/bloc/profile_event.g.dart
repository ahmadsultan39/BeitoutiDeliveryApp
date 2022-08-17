// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Logout extends Logout {
  factory _$Logout([void Function(LogoutBuilder)? updates]) =>
      (new LogoutBuilder()..update(updates))._build();

  _$Logout._() : super._();

  @override
  Logout rebuild(void Function(LogoutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogoutBuilder toBuilder() => new LogoutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Logout;
  }

  @override
  int get hashCode {
    return 676553867;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'Logout').toString();
  }
}

class LogoutBuilder implements Builder<Logout, LogoutBuilder> {
  _$Logout? _$v;

  LogoutBuilder();

  @override
  void replace(Logout other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Logout;
  }

  @override
  void update(void Function(LogoutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Logout build() => _build();

  _$Logout _build() {
    final _$result = _$v ?? new _$Logout._();
    replace(_$result);
    return _$result;
  }
}

class _$SetLogoutValue extends SetLogoutValue {
  factory _$SetLogoutValue([void Function(SetLogoutValueBuilder)? updates]) =>
      (new SetLogoutValueBuilder()..update(updates))._build();

  _$SetLogoutValue._() : super._();

  @override
  SetLogoutValue rebuild(void Function(SetLogoutValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetLogoutValueBuilder toBuilder() =>
      new SetLogoutValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetLogoutValue;
  }

  @override
  int get hashCode {
    return 178170261;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'SetLogoutValue').toString();
  }
}

class SetLogoutValueBuilder
    implements Builder<SetLogoutValue, SetLogoutValueBuilder> {
  _$SetLogoutValue? _$v;

  SetLogoutValueBuilder();

  @override
  void replace(SetLogoutValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetLogoutValue;
  }

  @override
  void update(void Function(SetLogoutValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetLogoutValue build() => _build();

  _$SetLogoutValue _build() {
    final _$result = _$v ?? new _$SetLogoutValue._();
    replace(_$result);
    return _$result;
  }
}

class _$GetBalance extends GetBalance {
  factory _$GetBalance([void Function(GetBalanceBuilder)? updates]) =>
      (new GetBalanceBuilder()..update(updates))._build();

  _$GetBalance._() : super._();

  @override
  GetBalance rebuild(void Function(GetBalanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetBalanceBuilder toBuilder() => new GetBalanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetBalance;
  }

  @override
  int get hashCode {
    return 651087350;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetBalance').toString();
  }
}

class GetBalanceBuilder implements Builder<GetBalance, GetBalanceBuilder> {
  _$GetBalance? _$v;

  GetBalanceBuilder();

  @override
  void replace(GetBalance other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetBalance;
  }

  @override
  void update(void Function(GetBalanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetBalance build() => _build();

  _$GetBalance _build() {
    final _$result = _$v ?? new _$GetBalance._();
    replace(_$result);
    return _$result;
  }
}

class _$GetOrdersHistory extends GetOrdersHistory {
  @override
  final int page;
  @override
  final bool firstRequest;

  factory _$GetOrdersHistory(
          [void Function(GetOrdersHistoryBuilder)? updates]) =>
      (new GetOrdersHistoryBuilder()..update(updates))._build();

  _$GetOrdersHistory._({required this.page, required this.firstRequest})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(page, r'GetOrdersHistory', 'page');
    BuiltValueNullFieldError.checkNotNull(
        firstRequest, r'GetOrdersHistory', 'firstRequest');
  }

  @override
  GetOrdersHistory rebuild(void Function(GetOrdersHistoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrdersHistoryBuilder toBuilder() =>
      new GetOrdersHistoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrdersHistory &&
        page == other.page &&
        firstRequest == other.firstRequest;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, page.hashCode), firstRequest.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetOrdersHistory')
          ..add('page', page)
          ..add('firstRequest', firstRequest))
        .toString();
  }
}

class GetOrdersHistoryBuilder
    implements Builder<GetOrdersHistory, GetOrdersHistoryBuilder> {
  _$GetOrdersHistory? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  bool? _firstRequest;
  bool? get firstRequest => _$this._firstRequest;
  set firstRequest(bool? firstRequest) => _$this._firstRequest = firstRequest;

  GetOrdersHistoryBuilder();

  GetOrdersHistoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _firstRequest = $v.firstRequest;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetOrdersHistory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrdersHistory;
  }

  @override
  void update(void Function(GetOrdersHistoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrdersHistory build() => _build();

  _$GetOrdersHistory _build() {
    final _$result = _$v ??
        new _$GetOrdersHistory._(
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'GetOrdersHistory', 'page'),
            firstRequest: BuiltValueNullFieldError.checkNotNull(
                firstRequest, r'GetOrdersHistory', 'firstRequest'));
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
