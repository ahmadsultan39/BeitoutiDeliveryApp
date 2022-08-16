import 'dart:convert';

import 'package:dio/dio.dart';

import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../injection.dart';
import '../network/models/base_response_model.dart';
import '../util/constants.dart';
import 'exceptions.dart';

Exception statusCodeHandler(Response response) {
  final String? errorMessage = BaseResponseModel<Null>.fromJson(
    json.decode(
      response.data,
    ),
  ).errors;
  if (response.statusCode == 400) {
    throw BadRequestException(
      error: errorMessage ?? ErrorMessage.error400,
    );
  } else if (response.statusCode == 401) {
    sl<ProfileBloc>().addLogoutEvent();
    throw UnauthorizedException(
      error: errorMessage ?? ErrorMessage.error401,
    );
  } else if (response.statusCode == 403) {
    throw ForbiddenException(
      error: errorMessage ?? ErrorMessage.error403,
    );
  } else if (response.statusCode == 404) {
    throw NotFoundException(
      error: errorMessage ?? ErrorMessage.error404,
    );
  } else if (response.statusCode == 422 || response.statusCode == 412) {
    throw UnprocessableEntityException(
      error: errorMessage ?? ErrorMessage.error422,
    );
  } else if (response.statusCode == 500) {
    throw InternalServerErrorException(
      error: errorMessage ?? ErrorMessage.error500,
    );
  } else if (response.statusCode == 503) {
    throw ServiceUnavailableException(
      error: errorMessage ?? ErrorMessage.error503,
    );
  } else {
    throw ServerException(
      error: ErrorMessage.someThingWentWrong,
    );
  }
}
