// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as int,
      userName: json['user_name'] as String,
      userPhoneNumber: json['user_phone_number'] as String,
      mealsCount: json['meals_count'] as int,
      totalCost: json['total_cost'] as int,
      hasNotes: json['has_notes'] as bool?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => OrderMealModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'user_name': instance.userName,
      'user_phone_number': instance.userPhoneNumber,
      'meals_count': instance.mealsCount,
      'total_cost': instance.totalCost,
      'has_notes': instance.hasNotes,
      'meals': instance.meals,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.approved: 'approved',
  OrderStatus.notApproved: 'notApproved',
  OrderStatus.prepared: 'prepared',
  OrderStatus.failedAssigning: 'failedAssigning',
  OrderStatus.picked: 'picked',
  OrderStatus.delivered: 'delivered',
  OrderStatus.notDelivered: 'notDelivered',
  OrderStatus.canceled: 'canceled',
};
