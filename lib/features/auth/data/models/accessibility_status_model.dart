import 'package:beitouti_delivery/features/auth/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/accessibility_status.dart';

part 'accessibility_status_model.g.dart';

@JsonSerializable()
class AccessibilityStatusModel extends AccessibilityStatus {

  static const String className = 'AccessibilityStatusModel';

  @JsonKey(name: 'user')
  final UserModel? userModel;
  @JsonKey(name: 'status')
  final int accessibilityStatus;

  AccessibilityStatusModel({
    required this.accessibilityStatus,
    required this.userModel,
  }) : super(
    status: AccessibilityStaysType.values[accessibilityStatus],
    delivery: userModel,
  );

  factory AccessibilityStatusModel.fromJson(Map<String, dynamic> json) =>
      _$AccessibilityStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessibilityStatusModelToJson(this);
}
