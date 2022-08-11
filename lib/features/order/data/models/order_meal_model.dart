import 'package:beitouti_delivery/features/order/domain/entities/order_meal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_meal_model.g.dart';

@JsonSerializable()
class OrderMealModel extends OrderMeal {

  static const String className = 'OrderMealModel';

  const OrderMealModel({
    required int id,
    required int price,
    required int quantity,
    required String name,
    required String? notes,
  }) : super(
          id: id,
          price: price,
          quantity: quantity,
          name: name,
          notes: notes,
        );

  factory OrderMealModel.fromJson(Map<String, dynamic> json) =>
      _$OrderMealModelFromJson(json);
}
