
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/register_request.dart';
import '../../domain/use_cases/check_code_use_case.dart';
import '../../domain/use_cases/request_register_use_case.dart';
import '../../domain/use_cases/send_code_use_case.dart';
import 'auth.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckCodeUseCase _checkCodeUseCase;
  final RequestRegisterUseCase _requestRegisterUseCase;
  final SendCodeUseCase _sendCodeUseCase;

  void addCheckCodeEvent({
    required String phoneNumber,
    required String code,
  }) {
    add(CheckCode(
          (b) => b
        ..phoneNumber = phoneNumber
        ..code = code,
    ));
  }

  void addSendCodeEvent({
    required String phoneNumber,
  }) {
    add(SendCode(
          (b) => b..phoneNumber = phoneNumber,
    ));
  }

  void addRequestRegisterEvent({required RegisterRequest request}) {
    add(RequestRegister(
          (b) => b ..request = request,
    ));
  }

  void clearMessage() {
    add(ClearMessage());
  }

  void reInitializeState() {
    add(ReInitializeState());
  }

  @factoryMethod
  AuthBloc(
      this._checkCodeUseCase,
      this._requestRegisterUseCase,
      this._sendCodeUseCase,
      ) : super(AuthState.initial()) {
    on<AuthEvent>(
          (event, emit) async {
        /// *** SendCode *** //
        if (event is SendCode) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _sendCodeUseCase(ParamsSendCodeUseCase(
            phoneNumber: event.phoneNumber,
          ));

          result.fold(
                (failure) => emit(
              state.rebuild(
                    (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error,
              ),
            ),
                (success) => emit(state.rebuild(
                  (b) => b
                ..isLoading = false
                ..isCodeSent = true,
            )),
          );
        }

        /// *** CheckCode *** //
        if (event is CheckCode) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _checkCodeUseCase(
            ParamsCheckCodeUseCase(
              phoneNumber: event.phoneNumber,
              code: event.code,
            ),
          );

          result.fold(
                (failure) => emit(
              state.rebuild(
                    (b) => b
                  ..isLoading = false
                  ..error = true
                  ..message = failure.error
              ),
            ),
                (accessibilityStatus) => emit(state.rebuild(
                  (b) => b
                ..isLoading = false
                ..isCodeValid = true
                ..accessibilityStaysType = accessibilityStatus.status
                ..user = accessibilityStatus.delivery,
            )),
          );
        }

        /// *** RequestRegister *** //
        if (event is RequestRegister) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _requestRegisterUseCase(
            ParamsRequestRegisterUseCase(request: event.request),
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
                  ..isRegisterRequestSent = true,
              ),
            ),
          );
        }

        /// *** ClearMessage *** //
        if (event is ClearMessage) {
          emit(
            state.rebuild(
                  (b) => b
                ..error = false
                ..message = '',
            ),
          );
        }

        /// *** ReInitializeState *** //
        if (event is ReInitializeState) {
          emit(
            state.rebuild(
                  (b) => b
                ..isLoading = false
                ..user = null
                ..isRegisterRequestSent = false
                ..accessibilityStaysType = null
                ..isCodeSent = false
                ..isCodeValid = false
                ..message = ""
                ..error = false,
            ),
          );
        }
      },
    );
  }
}
