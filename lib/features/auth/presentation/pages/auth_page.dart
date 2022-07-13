import 'package:beitouti_delivery/core/util/generate_screen.dart';
import 'package:beitouti_delivery/features/auth/presentation/pages/phone_number_page.dart';
import 'package:beitouti_delivery/features/auth/presentation/pages/work_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/enums.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../../../core/widgets/decor.dart';
import '../../../../injection.dart';
import '../../domain/entities/register_request.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/beitouti_text.dart';
import 'transportation_info.dart';
import 'confirm_phone_number_page.dart';
import 'name_and_email_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _bloc = sl<AuthBloc>();

  // Page View
  final PageController _pageController = PageController();
  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.fastOutSlowIn;

  // Phone Number
  final TextEditingController _phoneNumberTextController =
      TextEditingController();

  // Pin Code
  final TextEditingController _pinCodeTextController = TextEditingController();

  // Name
  final TextEditingController _nameTextController = TextEditingController();

  // Email
  final TextEditingController _emailTextController = TextEditingController();

  // Work Days
  final TextEditingController _workDaysTextController = TextEditingController();

  // Birth Date
  final TextEditingController _birthDateController = TextEditingController();

  // Work Hours From
  final TextEditingController _workHourFromTextController =
      TextEditingController();

  // Work Hours To
  final TextEditingController _workHourToTextController =
      TextEditingController();

  // Transportation Type
  late TransportationType _transportationType;

  // Gender
  late Gender _gender;

  @override
  void initState() {
    super.initState();
  }

  void _goToNextPage() {
    setState(() {
      _pageController.nextPage(
        duration: _duration,
        curve: _curve,
      );
    });
  }

  void _setTransportationType(int transportationNumber) {
    setState(() {
      _transportationType = TransportationType.values[transportationNumber];
    });
  }

  void _setGender(int gender) {
    setState(() {
      _gender = Gender.values[gender];
    });
  }

  void _sendCode() {
    _bloc.addSendCodeEvent(phoneNumber: _phoneNumberTextController.text);
  }

  void _checkCodeAndAccessibility() {
    _bloc.addCheckCodeEvent(
      phoneNumber: _phoneNumberTextController.text,
      code: _pinCodeTextController.text,
    );
  }

  void _requestRegister() {
    final _request = RegisterRequest(
      name: _nameTextController.text,
      email: _emailTextController.text,
      phoneNumber: _phoneNumberTextController.text,
      birthDate: _birthDateController.text,
      gender: _gender,
      workDays: _workDaysTextController.text,
      workHoursFrom: _workHourFromTextController.text,
      workHoursTo: _workHourToTextController.text,
      transportationType: _transportationType,
    );
    _bloc.addRequestRegisterEvent(
      request: _request,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        body: BlocListener<AuthBloc, AuthState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state.isCodeSent && _pageController.page == 0.0) {
              // Code now is sent and we are waiting for message
              _goToNextPage();
            }
            if (state.isCodeValid && _pageController.page == 1.0) {
              // Code is right, Now we must check accessibility status
              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.approved) {
                WidgetsBinding.instance?.addPostFrameCallback(
                  (_) {
                    Navigator.pushNamed(context, NameScreen.homeScreen);
                  },
                );
              }
              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.blocked) {
                showDialog(
                  context: context,
                  builder: (_) => CustomDialog(
                    content: 'عزيزي الطالب،\n هذا الحساب محظور',
                    title: Icon(
                      Icons.block_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35.sp,
                    ),
                  ),
                );
              }
              // if (state.accessibilityStaysType ==
              //     AccessibilityStaysType.inActive) {
              //   // Show inactive dialog and request for register again;
              // }
              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.isRejected) {
                showDialog(
                  context: context,
                  builder: (_) => CustomDialog(
                    content: 'عزيزي الطالب،\n طلب انضمامك قيد المراجعة حالياً',
                    title: Icon(
                      Icons.no_accounts,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35.sp,
                    ),
                  ),
                );
              }
              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.notApproved) {
                showDialog(
                  context: context,
                  builder: (_) => CustomDialog(
                    content: 'عزيزي الطالب،\n طلب انضمامك قيد المراجعة حالياً',
                    title: Icon(
                      Icons.lock_clock,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35.sp,
                    ),
                  ),
                );
              }
              if (state.accessibilityStaysType ==
                  AccessibilityStaysType.notRegistered) {
                // Navigator to next page;
                _goToNextPage();
              }
            }
            if (state.isRegisterRequestSent) {
              _bloc.reInitializeState();
              setState(
                () {
                  _pageController.jumpToPage(0);
                },
              );
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            bloc: _bloc,
            builder: (context, state) {
              WidgetsBinding.instance?.addPostFrameCallback(
                (_) {
                  message(
                    message: state.message,
                    isError: state.error,
                    context: context,
                    bloc: _bloc,
                  );
                },
              );
              return Stack(
                alignment: Alignment.center,
                children: [
                  const Decor(),
                  const BeitoutiText(),
                  Positioned(
                    top: 220.h,
                    child: SizedBox(
                      height: 500.h,
                      width: 375.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                        ),
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          reverse: true, //Because arabic is from right to left
                          children: [
                            PhoneNumberPage(
                              phoneNumberTextController:
                                  _phoneNumberTextController,
                              onPressed: _sendCode, //_sendCode,
                            ),
                            ConfirmPhoneNumberPage(
                              pinCodeTextController: _pinCodeTextController,
                              onPressed: _checkCodeAndAccessibility,
                            ),
                            NameAndEmailPage(
                              nameTextController: _nameTextController,
                              emailTextController: _emailTextController,
                              onPressed: _goToNextPage,
                            ),
                            TransportationInfo(
                              birthDateTextController: _birthDateController,
                              transportationTypeController:
                                  _setTransportationType,
                              genderController: _setGender,
                              onPressed: _goToNextPage,
                            ),
                            WorkInfoPage(
                              workDaysTextController: _workDaysTextController,
                              workHourFromTextController:
                                  _workHourFromTextController,
                              workHourToTextController:
                                  _workHourToTextController,
                              onPressed: _requestRegister,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state.isLoading) const Loader(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
