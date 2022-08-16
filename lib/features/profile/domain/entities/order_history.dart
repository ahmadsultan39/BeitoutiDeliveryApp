import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class OrderHistory extends Equatable {
  final int id;

  @JsonKey(name: 'meals_quantity')
  final int mealsQuantity;

  @JsonKey(name: 'total_cost')
  final double totalCost;

  @JsonKey(name: 'delivery_cost')
  final double deliveryCost;

  @JsonKey(name: 'chef_location')
  final String chefLocation;

  @JsonKey(name: 'chef_name')
  final String chefName;

  @JsonKey(name: 'distenation')
  final String destination;

  @JsonKey(name: 'delivered_at')
  final String deliveredAt;

  const OrderHistory({
    required this.id,
    required this.mealsQuantity,
    required this.totalCost,
    required this.deliveryCost,
    required this.chefLocation,
    required this.chefName,
    required this.destination,
    required this.deliveredAt,
  });

  @override
  List<Object?> get props => [
        id,
        mealsQuantity,
        deliveryCost,
        chefLocation,
        totalCost,
        deliveredAt,
        destination,
        chefName,
      ];
}
