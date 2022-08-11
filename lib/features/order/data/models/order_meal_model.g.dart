// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderMealModel _$OrderMealModelFromJson(Map<String, dynamic> json) =>
    OrderMealModel(
      id: json['id'] as int,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
      name: json['name'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$OrderMealModelToJson(OrderMealModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
      'name': instance.name,
      'notes': instance.notes,
    };
