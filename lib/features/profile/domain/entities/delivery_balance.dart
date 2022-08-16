import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'balance.dart';

class DeliveryBalance extends Equatable {
  final int balance;
  final Balance today;

  @JsonKey(name: 'this_week')
  final Balance thisWeek;

  @JsonKey(name: 'this_month')
  final Balance thisMonth;

  const DeliveryBalance({
    required this.balance,
    required this.thisMonth,
    required this.thisWeek,
    required this.today,
  });

  @override
  List<Object?> get props => [balance, thisWeek, thisMonth, today];
}
