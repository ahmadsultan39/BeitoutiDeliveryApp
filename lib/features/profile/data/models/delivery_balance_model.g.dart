// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryBalanceModel _$DeliveryBalanceModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryBalanceModel(
      balance: json['balance'] as int,
      today: BalanceModel.fromJson(json['today'] as Map<String, dynamic>),
      thisMonth:
          BalanceModel.fromJson(json['this_month'] as Map<String, dynamic>),
      thisWeek:
          BalanceModel.fromJson(json['this_week'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeliveryBalanceModelToJson(
        DeliveryBalanceModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'today': instance.today,
      'this_month': instance.thisMonth,
      'this_week': instance.thisWeek,
    };
