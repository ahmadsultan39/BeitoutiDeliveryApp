import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/constants.dart';

abstract class BaseLocalDataSource {
  Future<String> get token;

  Future<int> get userId;

  bool get status;

  Future<void> setStatus(bool value);

  Future<void> logout();
}

@LazySingleton(as: BaseLocalDataSource)
class BaseLocalDataSourceImpl implements BaseLocalDataSource {
  final SharedPreferences sharedPreferences;

  BaseLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> logout() async {
    sharedPreferences.remove(SharedPreferencesKeys.apiToken);
    sharedPreferences.remove(SharedPreferencesKeys.availabilityStatus);
  }

  @override
  Future<String> get token => Future.value(
        sharedPreferences.getString(
          SharedPreferencesKeys.apiToken,
        ),
      );

  @override
  Future<int> get userId => Future.value(
        sharedPreferences.getInt(
          SharedPreferencesKeys.userId,
        ),
      );

  @override
  Future<void> setStatus(bool value) async =>
      await sharedPreferences.setBool(SharedPreferencesKeys.availabilityStatus, value);

  @override
  bool get status =>
      sharedPreferences.getBool(SharedPreferencesKeys.availabilityStatus) ??
      false;
}
