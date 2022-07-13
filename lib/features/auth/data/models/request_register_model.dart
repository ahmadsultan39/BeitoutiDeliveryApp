import 'package:json_annotation/json_annotation.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/register_request.dart';

part 'request_register_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends RegisterRequest {
  static String className = "RegisterRequestModel";

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'transportation_type')
  final int transportationTypeIndex;

  @JsonKey(name: 'work_hours_from')
  final String workHoursFrom;

  @JsonKey(name: 'work_hours_to')
  final String workHoursTo;

  @JsonKey(name: 'work_days')
  final String workDays;

  @JsonKey(name: 'birth_date')
  final String birthDate;

  RegisterRequestModel({
    required String name,
    required String email,
    required int gender,
    required this.phoneNumber,
    required this.birthDate,
    required this.workDays,
    required this.workHoursTo,
    required this.workHoursFrom,
    required this.transportationTypeIndex,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          birthDate: birthDate,
          gender: Gender.values[gender],
          transportationType:
              TransportationType.values[transportationTypeIndex],
          workDays: workDays,
          workHoursFrom: workHoursFrom,
          workHoursTo: workHoursTo,
        );

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
