import 'package:beitouti_delivery/features/profile/domain/entities/delivery_balance.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/models/balance_model.dart';

part 'delivery_balance_model.g.dart';

@JsonSerializable()
class DeliveryBalanceModel extends DeliveryBalance {
  static const String className = 'DeliveryBalanceModel';

  final BalanceModel today;

  @JsonKey(name: 'this_month')
  final BalanceModel thisMonth;

  @JsonKey(name: 'this_week')
  final BalanceModel thisWeek;

  const DeliveryBalanceModel({
    required int balance,
    required this.today,
    required this.thisMonth,
    required this.thisWeek,
  }) : super(
          balance: balance,
          thisMonth: thisMonth,
          thisWeek: thisWeek,
          today: today,
        );

  factory DeliveryBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryBalanceModelFromJson(json);
}
