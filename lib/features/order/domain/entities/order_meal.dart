import 'package:equatable/equatable.dart';

class OrderMeal extends Equatable {
  final int id;
  final int price;
  final int quantity;
  final String name;
  final String? notes;

  const OrderMeal({
    required this.id,
    required this.price,
    required this.quantity,
    required this.name,
    required this.notes,
  });

  @override
  List<Object?> get props => [id, price, quantity, name, notes];
}
