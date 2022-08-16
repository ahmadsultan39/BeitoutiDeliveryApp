// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentDeliveryModel _$CurrentDeliveryModelFromJson(
        Map<String, dynamic> json) =>
    CurrentDeliveryModel(
      id: json['id'] as int,
      chefName: json['chef_name'] as String,
      destination: json['destination'] as String,
      chefPhoneNumber: json['chef_phone_number'] as String,
      selectedDeliveryTime: json['selected_delivery_time'] as String,
      totalMealCount: json['total_meal_count'] as int,
      totalCost: (json['total_cost'] as num).toDouble(),
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      chefLocation: ChefLocationModel.fromJson(
          json['chef_location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentDeliveryModelToJson(
        CurrentDeliveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'destination': instance.destination,
      'chef_name': instance.chefName,
      'chef_phone_number': instance.chefPhoneNumber,
      'total_cost': instance.totalCost,
      'total_meal_count': instance.totalMealCount,
      'selected_delivery_time': instance.selectedDeliveryTime,
      'orders': instance.orders,
      'chef_location': instance.chefLocation,
    };
