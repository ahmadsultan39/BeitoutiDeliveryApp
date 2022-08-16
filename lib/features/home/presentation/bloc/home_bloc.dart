import 'package:beitouti_delivery/core/usecase/usecase.dart';
import 'package:beitouti_delivery/features/home/domain/use_cases/change_availability_use_case.dart';
import 'package:beitouti_delivery/features/home/domain/use_cases/set_availability_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../injection.dart';
import '../../../current_delivery/presentation/bloc/current_delivery_bloc.dart';
import '../../domain/use_cases/change_availability_use_case.dart';
import '../../domain/use_cases/get_availability_status_use_case.dart';
import 'home.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ChangeAvailabilityUseCase _changeAvailabilityUseCase;
  final GetAvailabilityStatusUseCase _getAvailabilityStatusUseCase;
  final SetAvailabilityUseCase _setAvailabilityUseCase;

  void clearMessage() {
    add(ClearMessage());
  }

  void addChangeAvailabilityEvent() {
    add(ChangeAvailabilityEvent());
  }

  void addGetAvailabilityStatusEvent() {
    add(GetAvailabilityStatus());
  }

  void addSetAvailabilityEvent(bool status) {
    add(SetAvailabilityStatus((b) => b..status = status));
  }

  @factoryMethod
  HomeBloc(
    this._changeAvailabilityUseCase,
    this._getAvailabilityStatusUseCase,
    this._setAvailabilityUseCase,
  ) : super(HomeState.initial()) {
    on<HomeEvent>(
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

        /// *** GetAvailabilityStatus *** ///
        if (event is GetAvailabilityStatus) {
          final result = await _getAvailabilityStatusUseCase(NoParams());

          result.fold(
            (failure) => emit(state.rebuild((b) => b..active = false)),
            (status) => emit(state.rebuild((b) => b..active = status)),
          );
        }

        /// *** SetAvailabilityStatus *** ///
        if (event is SetAvailabilityStatus) {
          final result = await _setAvailabilityUseCase(
            ParamsSetAvailabilityUseCase(event.status),
          );

          result.fold(
            (failure) => emit(state.rebuild((b) => b..active = false)),
            (success) => emit(state.rebuild((b) => b..active = event.status)),
          );
        }

        /// *** ChangeAvailabilityEvent *** ///
        if (event is ChangeAvailabilityEvent) {
          if (sl<CurrentDeliveryBloc>().state.currentDelivery != null) {
            emit(
              state.rebuild(
                (b) => b..error = true
                ..message = 'لديك طلب بالفعل، لا يمكن تغيير الحالة',
              ),
            );
          } else {
            emit(state.rebuild((b) => b..isLoading = true));

            final result = await _changeAvailabilityUseCase(
              ParamsChangeAvailabilityStatus(
                state.active,
              ),
            );

            result.fold(
              (failure) => emit(
                state.rebuild(
                  (b) => b
                    ..isLoading = false
                    ..error = true
                    ..message = failure.error,
                ),
              ),
              (success) => emit(
                state.rebuild(
                  (b) => b
                    ..isLoading = false
                    ..active = !state.active
                    ..message = 'تم تغيير الحالة بنجاح',
                ),
              ),
            );
          }
        }
      },
    );
  }
}
