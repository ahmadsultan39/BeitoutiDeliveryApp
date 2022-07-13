import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/accessibility_status.dart';
import '../../domain/entities/register_request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/local/auth_local_data_source.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
import '../models/request_register_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthLocalDataSource _local;
  final AuthRemoteDataSource _http;

  AuthRepositoryImp(this._local, this._http);

  @override
  Future<Either<Failure, void>> sendCode({required String phoneNumber}) async {
    try {
      await _http.sendCode(phoneNumber: phoneNumber);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, AccessibilityStatus>> checkCode(
      {required String phoneNumber, required String code}) async {
    try {
      final accessibilityStatus = await _http.checkCodeAndAccessibility(
        phoneNumber: phoneNumber,
        code: code,
      );
      if (accessibilityStatus.status == AccessibilityStaysType.approved) {
        _local.saveUser(accessibilityStatus.userModel!);
      }
      return Right(accessibilityStatus);
    } on ServerException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }

  @override
  Future<Either<Failure, void>> requestRegister(
      {required RegisterRequest request}) async {
    try {
      await _http.requestRegister(
        request: RegisterRequestModel(
          name: request.name,
          email: request.email,
          gender: request.gender.index,
          phoneNumber: request.phoneNumber,
          birthDate: request.birthDate,
          workHoursTo: request.workHoursTo,
          workHoursFrom: request.workHoursFrom,
          workDays: request.workDays,
          transportationTypeIndex: request.transportationType.index,
        ),
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }
}
