import 'package:beitouti_delivery/features/current_delivery/domain/entities/chef_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chef_location_model.g.dart';

@JsonSerializable()
class ChefLocationModel extends ChefLocation {
  static const String className = 'ChefLocationModel';

  const ChefLocationModel({
    required int id,
    required String name,
    required double latitude,
    required double longitude,
  }) : super(
          id: id,
          name: name,
          latitude: latitude,
          longitude: longitude,
        );

  factory ChefLocationModel.fromJson(Map<String, dynamic> json) =>
      _$ChefLocationModelFromJson(json);
}
