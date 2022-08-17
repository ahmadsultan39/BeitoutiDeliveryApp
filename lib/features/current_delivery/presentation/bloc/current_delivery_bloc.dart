import 'package:beitouti_delivery/core/usecase/usecase.dart';
import 'package:beitouti_delivery/features/current_delivery/domain/use_cases/get_current_delivery_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'current_delivery.dart';

@lazySingleton
class CurrentDeliveryBloc
    extends Bloc<CurrentDeliveryEvent, CurrentDeliveryState> {
  final GetCurrentDeliveryUseCase _getCurrentDeliveryUseCase;

  void addGetCurrentDeliveryEvent() {
    add(GetCurrentDelivery());
  }

  void clearMessage() {
    add(ClearMessage());
  }

  @factoryMethod
  CurrentDeliveryBloc(
    this._getCurrentDeliveryUseCase,
  ) : super(CurrentDeliveryState.initial()) {
    on<CurrentDeliveryEvent>((event, emit) async {
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

      /*** GetCurrentDelivery ***/
      if (event is GetCurrentDelivery) {
        emit(
          state.rebuild(
            (b) => b
              ..isLoading = true
              ..currentDelivery = null,
          ),
        );

        final result = await _getCurrentDeliveryUseCase(NoParams());

        result.fold(
          (failure) => emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..error = true
                ..message = failure.error,
            ),
          ),
          (currentDelivery) => emit(
            state.rebuild(
              (b) => b
                ..isLoading = false
                ..currentDelivery = currentDelivery,
            ),
          ),
        );
      }
    });
  }
}
