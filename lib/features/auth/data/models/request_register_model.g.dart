// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegisterRequestModel(
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as int,
      phoneNumber: json['phone_number'] as String,
      birthDate: json['birth_date'] as String,
      workDays: json['work_days'] as String,
      workHoursTo: json['work_hours_to'] as String,
      workHoursFrom: json['work_hours_from'] as String,
      transportationTypeIndex: json['transportation_type'] as int,
    );

Map<String, dynamic> _$RegisterRequestModelToJson(
        RegisterRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'gender': _$GenderEnumMap[instance.gender]!,
      'phone_number': instance.phoneNumber,
      'transportation_type': instance.transportationTypeIndex,
      'work_hours_from': instance.workHoursFrom,
      'work_hours_to': instance.workHoursTo,
      'work_days': instance.workDays,
      'birth_date': instance.birthDate,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
