import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../error/exceptions.dart';
import '../error/status_code_handler.dart';
import '../network/models/base_list_response_model.dart';
import '../network/models/base_response_model.dart';
import '../util/constants.dart';

abstract class BaseRemoteDataSource {
  @protected
  Future<T?> performPostRequest<T>({
    required String endpoint,
    required dynamic data,
    required Options options,
    Map<String, dynamic>? queryParams,
  });

  @protected
  Future<T?> performPutRequest<T>({
    required String endpoint,
    required dynamic data,
    required Options options,
  });

  @protected
  Future<T?> performDeleteRequest<T>({
    required String endpoint,
    required Options options,
    dynamic data,
    Map<String, dynamic>? queryParams,
  });

  @protected
  Future<List<T>> performGetListRequest<T>({
    required String endpoint,
    required String token,
  });

  @protected
  Future<T> performGetRequest<T>({
    required String endpoint,
    required String token,
    Map<String, dynamic>? params,
  });
}

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio dio;

  BaseRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<T>> performGetListRequest<T>({
    required String endpoint,
    required String token,
  }) async {
    debugPrint("PerformGetListRequest");
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final BaseListResponseModel<T> finalResponse =
            BaseListResponseModel<T>.fromJson(json.decode(response.data));
        if (finalResponse.data != null) {
          debugPrint("Data is not null");
          return finalResponse.data!;
        } else {
          debugPrint("Data is null");
          return [];
        }
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw statusCodeHandler(e.response!);
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }

  @override
  Future<T?> performPostRequest<T>({
    required String endpoint,
    required Options options,
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    debugPrint("performPostRequest");
    try {
      final response = await dio.post(
        endpoint,
        options: options,
        data: data,
        queryParameters: queryParams,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(
          json.decode(response.data),
        );
        return finalResponse.data;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw statusCodeHandler(e.response!);
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }

  @override
  Future<T> performGetRequest<T>({
    required String endpoint,
    required String token,
    Map<String, dynamic>? params,
  }) async {
    debugPrint("PerformGetRequest");
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(token),
        queryParameters: params,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (finalResponse.data != null) {
          return finalResponse.data!;
        } else {
          throw ServerException(error: '');
        }
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw statusCodeHandler(e.response!);
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }

  @override
  Future<T?> performPutRequest<T>({
    required String endpoint,
    required Options options,
    data,
  }) async {
    debugPrint("performPutRequest");
    try {
      final response = await dio.put(
        endpoint,
        options: options,
        data: data,
        queryParameters: {
          "_method": "PUT",
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(
          json.decode(response.data),
        );
        return finalResponse.data;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw statusCodeHandler(e.response!);
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }

  @override
  Future<T?> performDeleteRequest<T>({
    required String endpoint,
    required Options options,
    data,
    Map<String, dynamic>? queryParams,
  }) async {
    debugPrint("performDeleteRequest");
    try {
      final response = await dio.delete(
        endpoint,
        options: options,
        data: data,
        queryParameters: queryParams,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final BaseResponseModel<T> finalResponse =
            BaseResponseModel<T>.fromJson(
          json.decode(response.data),
        );
        return finalResponse.data;
      } else {
        throw ServerException(error: ErrorMessage.someThingWentWrong);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw statusCodeHandler(e.response!);
      } else {
        throw ServerException(
          error: ErrorMessage.someThingWentWrong,
        );
      }
    }
  }
}
