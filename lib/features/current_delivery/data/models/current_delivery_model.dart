import 'package:beitouti_delivery/core/models/order_model.dart';
import 'package:beitouti_delivery/features/current_delivery/data/models/chef_location_model.dart';
import 'package:beitouti_delivery/features/current_delivery/domain/entities/current_delivery.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_delivery_model.g.dart';

@JsonSerializable()
class CurrentDeliveryModel extends CurrentDelivery {

  static const String className = 'CurrentDeliveryModel';

  final List<OrderModel> orders;

  @JsonKey(name: 'chef_location')
  final ChefLocationModel chefLocation;

  const CurrentDeliveryModel({
    required int id,
    required String chefName,
    required String destination,
    required String selectedDeliveryTime,
    required int totalMealCount,
    required double totalCost,
    required this.orders,
    required this.chefLocation,
  }) : super(
          id: id,
          chefName: chefName,
          chefLocation: chefLocation,
          destination: destination,
          selectedDeliveryTime: selectedDeliveryTime,
          totalMealCount: totalMealCount,
          totalCost: totalCost,
          orders: orders,
        );

  factory CurrentDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentDeliveryModelFromJson(json);
}
