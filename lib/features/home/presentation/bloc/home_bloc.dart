import 'package:beitouti_delivery/core/usecase/usecase.dart';
import 'package:beitouti_delivery/features/home/domain/use_cases/change_availability_status_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/presentation/bloc/app_bloc.dart';
import '../../../../injection.dart';
import 'home.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ChangeAvailabilityStatusUseCase _changeAvailabilityStatusUseCase;

  void clearMessage() {
    add(ClearMessage());
  }

  void addChangeAvailabilityStatusEvent() {
    add(ChangeAvailabilityStatus());
  }

  @factoryMethod
  HomeBloc(
    this._changeAvailabilityStatusUseCase,
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

        /*** ChangeAvailabilityStatus ***/
        if (event is ChangeAvailabilityStatus) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _changeAvailabilityStatusUseCase(NoParams());

          result.fold(
              (failure) => emit(
                    state.rebuild(
                      (b) => b
                        ..isLoading = false
                        ..error = true
                        ..message = failure.error,
                    ),
                  ), (success) {
            emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..message = 'تم تغيير الحالة بنجاح',
              ),
            );
            sl<AppBloc>().addSubscribeToOrderIsPreparedChannelEvent();
          });
        }
      },
    );
  }
}
