import 'package:beitouti_delivery/features/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/util/enums.dart';

class AccessibilityStatus extends Equatable {
  final AccessibilityStaysType status;
  final User? delivery;

  const AccessibilityStatus({
    required this.status,
    required this.delivery,
  });

  @override
  List<Object?> get props => [status, delivery];
}
