import 'package:beitouti_delivery/app/domain/use_cases/get_pusher_options_use_case.dart';
import 'package:beitouti_delivery/app/domain/use_cases/get_user_id_use_case.dart';
import 'package:beitouti_delivery/app/domain/use_cases/subscribe_to_prepared_order_channel_use_case.dart';
import 'package:beitouti_delivery/core/usecase/usecase.dart';
import 'package:beitouti_delivery/features/current_delivery/presentation/bloc/current_delivery_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:laravel_echo/laravel_echo.dart';
import 'package:location/location.dart';
import 'package:pusher_client/pusher_client.dart';

import '../../../injection.dart';
import 'app.dart';

@lazySingleton
class AppBloc extends Bloc<AppEvent, AppState> {
  final UpdateCurrentLocationUseCase _updateCurrentLocationUseCase;
  final GetPusherOptionsUseCase _getPusherOptionsUseCase;
  final GetUserIdUseCase _getUserIdUseCase;
  final Location _location;

  void addSubscribeToOrderIsPreparedChannelEvent() {
    add(SubscribeToOrderIsPreparedChannel());
  }

  void addSubscribeToOrderIsAssignedChannelEvent() {
    add(SubscribeToOrderIsAssignedChannel());
  }

  void clearMessage() {
    add(ClearMessage());
  }

  @factoryMethod
  AppBloc(
    this._updateCurrentLocationUseCase,
    this._location,
    this._getPusherOptionsUseCase,
    this._getUserIdUseCase,
  ) : super(AppState.initial()) {
    on<AppEvent>(
      (event, emit) async {
        /*** ClearMessage ***/
        if (event is ClearMessage) {
          emit(
            state.rebuild(
              (b) => b
                ..error = false
                ..message = '',
            ),
          );
        }
        if (event is SubscribeToOrderIsPreparedChannel) {
          final getOptionsResult = await _getPusherOptionsUseCase(NoParams());
          getOptionsResult.fold(
            (failure) {
              // TODO handle get options failure
              debugPrint("GetOptionsFailure");
            },
            (options) {
              final PusherClient pusherClient = PusherClient(
                '123456',
                options,
                autoConnect: false,
                enableLogging: true,
              );
              pusherClient.onConnectionError((error) {
                debugPrint('onConnectionError');
                debugPrint(error?.code);
                debugPrint(error?.exception);
                debugPrint(error?.message);
                debugPrint('*****************');
              });
              final Echo echo = Echo(
                broadcaster: EchoBroadcasterType.Pusher,
                client: pusherClient,
              );
              echo.channel('order.deliverymen').listen(
                'OrderIsPrepared',
                (_) async {
                  // TODO check if online or offline
                  debugPrint('\n\nHere is an event 😍😍😍\n\n');
                  bool _serviceEnabled;
                  PermissionStatus _permissionGranted;

                  _serviceEnabled = await _location.serviceEnabled();
                  if (!_serviceEnabled) {
                    _serviceEnabled = await _location.requestService();
                    if (!_serviceEnabled) {
                      await _location.requestService();
                    }
                  }

                  _permissionGranted = await _location.hasPermission();
                  while (_permissionGranted == PermissionStatus.denied ||
                      _permissionGranted == PermissionStatus.deniedForever) {
                    _permissionGranted = await _location.requestPermission();
                    if (_permissionGranted == PermissionStatus.granted ||
                        _permissionGranted == PermissionStatus.grantedLimited) {
                      break;
                    }
                  }

                  final locationData = await _location.getLocation();
                  await _updateCurrentLocationUseCase(
                    ParamsUpdateCurrentLocationUseCase(
                      longitude: locationData.longitude!,
                      latitude: locationData.latitude!,
                    ),
                  );
                },
              );
            },
          );
        }

        if (event is SubscribeToOrderIsAssignedChannel) {
          final getOptionsResult = await _getPusherOptionsUseCase(NoParams());
          final getUserIdResult = await _getUserIdUseCase(NoParams());
          getOptionsResult.fold(
            (failure) {
              // TODO handle get options failure
              debugPrint("GetOptionsFailure");
            },
            (options) {
              getUserIdResult.fold(
                (l) => null,
                (userId) {
                  final PusherClient pusherClient = PusherClient(
                    '123456',
                    options,
                    autoConnect: false,
                    enableLogging: true,
                  );
                  pusherClient.onConnectionError((error) {
                    debugPrint('onConnectionError');
                    debugPrint(error?.code);
                    debugPrint(error?.exception);
                    debugPrint(error?.message);
                    debugPrint('*****************');
                  });
                  final Echo echo = Echo(
                    broadcaster: EchoBroadcasterType.Pusher,
                    client: pusherClient,
                  );
                  echo.channel('deliveryman.$userId').listen(
                    'DeliveryIsAssigned',
                    (_) async {
                      debugPrint('\n\nHere is an event ❤❤❤❤❤❤\n\n');
                      // todo change status to unavailable locally
                      sl<CurrentDeliveryBloc>().addGetCurrentDeliveryEvent();
                    },
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
