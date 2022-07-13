import 'package:beitouti_delivery/core/entities/order.dart';
import 'package:beitouti_delivery/core/models/order_model.dart';
import 'package:beitouti_delivery/features/current_delivery/data/models/chef_location_model.dart';
import 'package:beitouti_delivery/features/current_delivery/domain/entities/chef_location.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CurrentDelivery extends Equatable {
  final int id;
  final String destination;

  final List<Order> orders;

  @JsonKey(name: 'chef_name')
  final String chefName;

  @JsonKey(name: 'total_cost')
  final int totalCost;

  @JsonKey(name: 'total_meal_count')
  final int totalMealCount;

  @JsonKey(name: 'chef_location')
  final ChefLocation chefLocation;

  @JsonKey(name: 'selected_delivery_time')
  final String selectedDeliveryTime;

  const CurrentDelivery({
    required this.id,
    required this.chefName,
    required this.chefLocation,
    required this.destination,
    required this.selectedDeliveryTime,
    required this.totalMealCount,
    required this.totalCost,
    required this.orders,
  });

  @override
  List<Object?> get props => [
        id,
        chefLocation,
        chefName,
        destination,
        selectedDeliveryTime,
        totalMealCount,
        totalCost,
        orders
      ];
}
