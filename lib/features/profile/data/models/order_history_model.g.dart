// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryModel _$OrderHistoryModelFromJson(Map<String, dynamic> json) =>
    OrderHistoryModel(
      id: json['id'] as int,
      mealsQuantity: json['meals_quantity'] as int,
      totalCost: (json['total_cost'] as num).toDouble(),
      deliveryCost: (json['delivery_cost'] as num).toDouble(),
      chefLocation: json['chef_location'] as String,
      chefName: json['chef_name'] as String,
      destination: json['distenation'] as String,
      deliveredAt: json['delivered_at'] as String,
    );

Map<String, dynamic> _$OrderHistoryModelToJson(OrderHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meals_quantity': instance.mealsQuantity,
      'total_cost': instance.totalCost,
      'delivery_cost': instance.deliveryCost,
      'chef_location': instance.chefLocation,
      'chef_name': instance.chefName,
      'distenation': instance.destination,
      'delivered_at': instance.deliveredAt,
    };
