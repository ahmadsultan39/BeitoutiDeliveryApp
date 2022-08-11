// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chef_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChefLocationModel _$ChefLocationModelFromJson(Map<String, dynamic> json) =>
    ChefLocationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$ChefLocationModelToJson(ChefLocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
