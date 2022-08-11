import 'package:beitouti_delivery/core/util/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../features/auth/data/models/request_register_model.dart';

class Endpoints {
  static const baseUrl = "https://78f8-31-9-140-112.ngrok.io/api/delivery";
  static const imageUrl = "https://78f8-31-9-140-112.ngrok.io";
  static const socketUrl = "abf2-31-9-140-112.ngrok.io";
  static const authBroadcasting =
      "https://78f8-31-9-140-112.ngrok.io/api/broadcasting/auth";
  static const sendCode = "/send-code";
  static const checkCodeAndAccessibility = "/check-code-and-accessibility";
  static const requestRegister = "/request-register";
  static const updateCurrentLocation = "/update-current-location";
  static const currentDelivery = "/current-delivery";
  static const changeAvailabilityStatus = "/change-availability-status";

  static String getOrder(int orderId) => "/current-delivery/orders/$orderId";

  static String changeOrderStatus(int orderId) =>
      "/current-delivery/orders/$orderId/change-status";

  static String reportOrder(int orderId) =>
      "/current-delivery/orders/$orderId/report";
}

class SocketEndpoints {}

class SharedPreferencesKeys {
  static String userId = 'user_id';
  static String apiToken = 'token';
  static String userName = 'user_name';
  static String userEmail = 'user_email';
  static String userPhoneNumber = 'user_phone_number';
  static String userCampusCardExpiryDate = 'user_campus_card_expiry_date';
}

class ErrorMessage {
  static String error400 = 'الطلب الذي تم إرساله غير صالح';
  static String error401 = 'فشلت عملية المصادقة مع الخادم';
  static String error403 = 'لا يوجد لديك إذن للقيام بهذه العملية';
  static String error404 = 'المورد المطلوب غير موجود';
  static String error422 = 'االبيانات المدخلة غير صحيحة';
  static String error500 = 'حدث خطأ ما في عملية التواصل مع الخادم';
  static String error503 = 'الخدمة المطلوب غير متوفرة حالياً';
  static String someThingWentWrong = 'حدث خطأ ما';
  static String nullData = 'لايوجد بيانات لعرضها';
}

final option = Options(
  headers: {
    'Accept': 'application/json',
  },
);

final baseOptions = BaseOptions(
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
);

class RequestBody {
  // Change Order Status
  static FormData changeOrderStatus({required OrderStatus newStatus}) {
    return FormData.fromMap({
      'new_status': newStatus.name,
    });
  }

  // Report Order
  static FormData reportOrder({
    required String reason,
    required String reportedOn,
  }) {
    return FormData.fromMap({
      'reason': reason,
      'reported_on': reportedOn,
    });
  }

  // Send Code
  static FormData sendCode({required String phoneNumber}) {
    return FormData.fromMap({
      'phone_number': phoneNumber,
    });
  }

  // Check Code
  static FormData checkCode({
    required String phoneNumber,
    required String code,
    required String fcmToken,
  }) {
    return FormData.fromMap({
      'phone_number': phoneNumber,
      'code': code,
      'fcm_token': fcmToken,
    });
  }

  // Request Register
  static FormData requestRegister({
    required RegisterRequestModel request,
    required String fcmToken,
  }) {
    return FormData.fromMap({
      'phone_number': request.phoneNumber,
      'birth_date': request.birthDate,
      'name': request.name,
      'email': request.email,
      'gender': request.gender.index,
      'transportation_type': request.transportationType.index,
      'work_hours_from': request.workHoursFrom,
      'work_hours_to': request.workHoursTo,
      'work_days': request.workDays,
      'fcm_token': fcmToken,
    });
  }
}

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String? token, {int isPagination = 0}) {
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': ' Bearer $token',
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
    return options;
  }
}

void message({
  required String message,
  required bool isError,
  required BuildContext context,
  required bloc,
}) {
  // For debug only
  debugPrint('Message is "$message"');
  debugPrint(bloc.state.toString());

  if (message.isNotEmpty) {
    if (isError) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.withOpacity(1.0),
        textColor: Colors.white,
        fontSize: 16.0.sp,
      );
    } else {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        textColor: Colors.white,
        fontSize: 16.0.sp,
      );
    }
    bloc.clearMessage();
  }
}
