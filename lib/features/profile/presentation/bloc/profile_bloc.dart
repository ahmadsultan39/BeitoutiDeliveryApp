import 'package:beitouti_delivery/core/usecase/usecase.dart';
import 'package:beitouti_delivery/features/profile/domain/use_cases/get_delivery_balance_use_case.dart';
import 'package:beitouti_delivery/features/profile/domain/use_cases/get_orders_history_use_case.dart';
import 'package:beitouti_delivery/features/profile/domain/use_cases/logout_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/params/paginate_list_params.dart';
import 'profile.dart';

@lazySingleton
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetDeliveryBalanceUseCase _getDeliveryBalanceUseCase;
  final GetOrdersHistoryUseCase _getOrdersHistoryUseCase;
  final LogoutUseCase _logoutUseCase;

  void clearMessage() {
    add(ClearMessage());
  }

  void addGetOrdersHistoryEvent() {
    add(GetOrdersHistory((b) => b..page = state.orderHistory.currentPage));
  }

  void addGetBalanceEvent() {
    add(GetBalance());
  }

  void addSetLogoutValue() {
    add(SetLogoutValue());
  }

  void addLogoutEvent() {
    add(Logout());
  }

  @factoryMethod
  ProfileBloc(
    this._getDeliveryBalanceUseCase,
    this._getOrdersHistoryUseCase,
    this._logoutUseCase,
  ) : super(ProfileState.initial()) {
    on<ProfileEvent>(
      (event, emit) async {
        /// *** ClearMessage *** ///
        if (event is ClearMessage) {
          emit(
            state.rebuild(
              (b) => b
                ..error = false
                ..message = '',
            ),
          );
        }

        /// *** SetLogoutValue *** ///
        if (event is SetLogoutValue) {
          emit(state.rebuild((b) => b..isLoggedOut = false));
        }

        /// *** Logout *** ///
        if (event is Logout) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _logoutUseCase(NoParams());

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
                  ..isLoggedOut = true,
              ),
            ),
          );
        }

        /// *** GetOrderHistory *** ///
        if (event is GetOrdersHistory) {
          if (!state.orderHistory.isFinished) {
            if (event.page == 1) {
              emit(state.rebuild((b) => b..isLoading = true));
            } else {
              emit(state.rebuild((b) => b..orderHistory.isLoading = true));
            }

            final result = await _getOrdersHistoryUseCase(
              PaginateListParams(event.page),
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
              (orderHistory) => emit(
                state.rebuild(
                  (b) => b
                    ..isLoading = false
                    ..orderHistory.items.addAll(orderHistory.data)
                    ..orderHistory.isLoading = false
                    ..orderHistory.currentPage = event.page
                    ..orderHistory.isFinished =
                        event.page == orderHistory.pages,
                ),
              ),
            );
          }
        }

        /// *** GetBalance *** ///
        if (event is GetBalance) {
          emit(
            state.rebuild(
              (b) => b
                ..isLoading = true
                ..balance = null,
            ),
          );

          final result = await _getDeliveryBalanceUseCase(NoParams());

          result.fold(
            (failure) => emit(
              state.rebuild(
                (b) => b
                  ..message = failure.error
                  ..error = true
                  ..isLoading = false,
              ),
            ),
            (balance) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..balance = balance,
              ),
            ),
          );
        }
      },
    );
  }
}
