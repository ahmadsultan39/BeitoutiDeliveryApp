import 'package:beitouti_delivery/core/entities/order.dart';
import 'package:beitouti_delivery/features/order/data/models/order_meal_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../util/enums.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends Order {
  static const String className = 'OrderModel';

  final List<OrderMealModel>? meals;

  const OrderModel({
    required int id,
    required String userName,
    required String userPhoneNumber,
    required int mealsCount,
    required double totalCost,
    required bool? hasNotes,
    required OrderStatus? status,
    required this.meals,
  }) : super(
          status: status,
          id: id,
          userName: userName,
          userPhoneNumber: userPhoneNumber,
          mealsCount: mealsCount,
          totalCost: totalCost,
          hasNotes: hasNotes,
          meals: meals,
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
