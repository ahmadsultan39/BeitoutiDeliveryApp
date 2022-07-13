import 'dart:convert';
import 'package:beitouti_delivery/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/data/base_remote_datasource.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/models/base_response_model.dart';
import '../../../../../core/util/constants.dart';
import '../../models/accessibility_status_model.dart';
import '../../models/request_register_model.dart';
import 'auth_remote_data_source.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements AuthRemoteDataSource {
  AuthRemoteDataSourceImp({required Dio dio}) : super(dio: dio);

  @override
  Future<AccessibilityStatusModel> checkCodeAndAccessibility({
    required String phoneNumber,
    required String code,
  }) async {
    final formData =
    RequestBody.checkCode(phoneNumber: phoneNumber, code: code);

    try {
      final response = await dio.post(
        Endpoints.checkCodeAndAccessibility,
        options: GetOptions.getOptionsWithToken(''),
        data: formData,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result =
        BaseResponseModel<UserModel>.fromJson(json.decode(response.data));
        return AccessibilityStatusModel(
            accessibilityStatus: result.status!, userModel: result.data);
      } else {
        throw ServerException(error: ErrorMessage.error401);
      }
    } on DioError catch (e) {
      final result =
      BaseResponseModel<Null>.fromJson(json.decode(e.response!.data));
      if(result.status! == 3){
        throw ServerException(error: result.errors!);
      }
      return AccessibilityStatusModel(
          accessibilityStatus: result.status!, userModel: result.data);
    }
  }

  @override
  Future<void> requestRegister({required RegisterRequestModel request}) async {
    final formData = RequestBody.requestRegister(request: request);
    print(formData.fields);
    try {
      final response = await dio.post(
        Endpoints.requestRegister,
        options: GetOptions.options,
        data: formData,
      );
      return Future.value(null);
    } on DioError catch (e) {
      debugPrint('****Error**** Response Error is ${e.error} *****');
      debugPrint('****Error**** Response Message is ${e.message} *****');
      final errors = BaseResponseModel<Null>.fromJson(
        json.decode(e.response!.data),
      ).errors;
      throw ServerException(error: errors!);
    }
  }

  @override
  Future<void> sendCode({required String phoneNumber}) async {
    final formData = RequestBody.sendCode(phoneNumber: phoneNumber);
    try {
      final response = await dio.post(
        Endpoints.sendCode,
        options: GetOptions.options,
        data: formData,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Future.value(null);
      } else {
        throw ServerException(error: ErrorMessage.error401);
      }
    } catch (e) {
      throw ServerException(error: ErrorMessage.error401);
    }
  }
}
