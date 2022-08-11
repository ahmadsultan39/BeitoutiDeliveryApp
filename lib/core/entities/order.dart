import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:beitouti_delivery/features/order/domain/entities/order_meal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Order extends Equatable {
  final int id;

  final OrderStatus? status; // will not be null if user inside order page

  final List<OrderMeal>? meals; // will not be null if user inside order page

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'user_phone_number')
  final String userPhoneNumber;

  @JsonKey(name: 'meals_count')
  final int mealsCount;

  @JsonKey(name: 'total_cost')
  final double totalCost;

  @JsonKey(name: 'has_notes')
  final bool? hasNotes; // will not be null if user inside current delivery page

  const Order({
    required this.id,
    required this.status,
    required this.userName,
    required this.userPhoneNumber,
    required this.mealsCount,
    required this.totalCost,
    required this.hasNotes,
    required this.meals,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        userPhoneNumber,
        mealsCount,
        meals,
        totalCost,
        hasNotes,
      ];
}
