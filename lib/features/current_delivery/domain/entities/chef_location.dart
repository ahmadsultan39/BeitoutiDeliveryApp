import 'package:equatable/equatable.dart';

class ChefLocation extends Equatable {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  const ChefLocation({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [id, name, latitude, longitude];
}
