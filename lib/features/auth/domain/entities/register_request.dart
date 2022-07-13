import 'package:equatable/equatable.dart';
import '../../../../core/util/enums.dart';

class RegisterRequest extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String birthDate;
  final String workDays;
  final String workHoursFrom;
  final String workHoursTo;
  final TransportationType transportationType;
  final Gender gender;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.transportationType,
    required this.workDays,
    required this.workHoursFrom,
    required this.workHoursTo,
    required this.phoneNumber,
    required this.birthDate,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        birthDate,
        gender,
        transportationType,
        workHoursTo,
        workHoursFrom,
        workDays
      ];
}
