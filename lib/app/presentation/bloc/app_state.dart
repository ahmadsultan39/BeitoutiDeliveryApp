import 'package:built_value/built_value.dart';
import 'package:laravel_echo/laravel_echo.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  bool get isLoading;

  String get message;

  bool get error;


  AppState._();

  factory AppState([Function(AppStateBuilder b) updates]) = _$AppState;

  factory AppState.initial() {
    return AppState(
      (b) => b
        ..isLoading = false
        ..message = ""
        ..error = false,
    );
  }
}
