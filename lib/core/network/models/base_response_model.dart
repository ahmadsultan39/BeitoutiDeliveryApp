library base_response_model;

import 'package:beitouti_delivery/core/models/order_model.dart';
import 'package:beitouti_delivery/features/auth/data/models/user_model.dart';
import 'package:beitouti_delivery/features/current_delivery/data/models/chef_location_model.dart';
import 'package:beitouti_delivery/features/current_delivery/data/models/current_delivery_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../features/auth/data/models/accessibility_status_model.dart';
import '../../../features/order/data/models/order_meal_model.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel<T> {
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'errors')
  final String? errors;
  @JsonKey(name: 'data', fromJson: _dataFromJson, toJson: _dataToJson)
  final T? data;

  BaseResponseModel({this.status, this.errors, this.data});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson<T>(json);
  }
}

T? _dataFromJson<T>(Object? data) {
  debugPrint("T is: ${T.toString()}");
  if ((data is List<dynamic> && data.isEmpty) || data == null) {
    return null;
  }
  // UserModel
  else if (T.toString() == UserModel.className) {
    return UserModel.fromJson(data as Map<String, dynamic>) as T;
  }
  // CurrentDeliveryModel
  else if (T.toString() == CurrentDeliveryModel.className) {
    return CurrentDeliveryModel.fromJson(data as Map<String, dynamic>) as T;
  }
  // ChefLocationModel
  else if (T.toString() == ChefLocationModel.className) {
    return ChefLocationModel.fromJson(data as Map<String, dynamic>) as T;
  }
  // OrderModel
  else if (T.toString() == OrderModel.className) {
    return OrderModel.fromJson(data as Map<String, dynamic>) as T;
  }
  // OrderMealModel
  else if (T.toString() == OrderMealModel.className) {
    return OrderMealModel.fromJson(data as Map<String, dynamic>) as T;
  }
  // Null data
  else if (T.toString() == 'Null') {
    debugPrint('Null Data');
    return null;
  }
  throw Exception('parse error');
}

Map<String, dynamic> _dataToJson<T, S, U>(T input, [S? other1, U? other2]) =>
    {'data': input};
