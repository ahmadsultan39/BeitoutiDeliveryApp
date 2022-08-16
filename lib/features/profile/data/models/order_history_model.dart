import 'package:beitouti_delivery/features/profile/domain/entities/order_history.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_history_model.g.dart';

@JsonSerializable()
class OrderHistoryModel extends OrderHistory {
  static const String className = 'OrderHistoryModel';
  static const String paginateName = 'PaginateResponseModel<OrderHistoryModel>';

  const OrderHistoryModel({
    required int id,
    required int mealsQuantity,
    required double totalCost,
    required double deliveryCost,
    required String chefLocation,
    required String chefName,
    required String destination,
    required String deliveredAt,
  }) : super(
          id: id,
          mealsQuantity: mealsQuantity,
          totalCost: totalCost,
          deliveryCost: deliveryCost,
          chefLocation: chefLocation,
          chefName: chefName,
          destination: destination,
          deliveredAt: deliveredAt,
        );

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);
}
