import 'package:beitouti_delivery/core/util/constants.dart';
import 'package:beitouti_delivery/features/splash/presentation/pages/splash_page.dart';
import 'package:beitouti_delivery/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/util/app_localizations.dart';
import '../../core/util/generate_screen.dart';
import 'bloc/app.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _bloc = sl<AppBloc>();

  @override
  void initState() {
    _bloc.addSubscribeToOrderIsPreparedChannelEvent();
    _bloc.addSubscribeToOrderIsAssignedChannelEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // For portrait use only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return BlocBuilder<AppBloc, AppState>(
      bloc: _bloc,
      builder: (context, state) {
        message(
          message: state.message,
          isError: state.error,
          context: context,
          bloc: _bloc,
        );
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context,child) {
            return MaterialApp(
              navigatorKey: App.navigatorKey,
              title: 'Beitouti',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: GenerateScreen.onGenerate,
              theme: ThemeData(
                  fontFamily: "Thesans",
                  primaryColor: const Color(0xFF013760),
                  backgroundColor: const Color(0xFFE1E8EA),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: const Color(0xFF013760),
                    secondary: const Color(0xFF2B9694),
                    background: const Color(0xFFE1E8EA),
                    tertiary: const Color(0xFFEC9005),
                  )),
              home: const SplashPage(),
              locale: const Locale('ar', ''),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar', ''),
              ],
            );
          },
        );
      },
    );
  }
}

// class TestPage extends StatefulWidget {
//   const TestPage({Key? key}) : super(key: key);
//
//   @override
//   State<TestPage> createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//   late final Echo echo;
//   late final PusherOptions options;
//   late final PusherClient pusherClient;
//
//   @override
//   void initState() {
//     options = PusherOptions(
//       host: 'abf2-31-9-140-112.ngrok.io',
//       encrypted: true,
//       auth: PusherAuth(
//         "https://78f8-31-9-140-112.ngrok.io/api/broadcasting/auth",
//         headers: {
//           'Authorization':
//               'Bearer 103|bVMO4yjbDlLhlmM8xrvBIHU21Xa0B69zBDjnjEQz',
//         },
//       ),
//     );
//
//     pusherClient = PusherClient(
//       '123456',
//       options,
//       autoConnect: false,
//       enableLogging: true,
//     );
//
//     pusherClient.onConnectionError((error) {
//       print('onConnectionError');
//       print(error?.code);
//       print(error?.exception);
//       print(error?.message);
//       print('*****************');
//     });
//
//     echo = Echo(
//       broadcaster: EchoBroadcasterType.Pusher,
//       client: pusherClient,
//     );
//     echo.private("test.channel").listen(
//       "TestEvent",
//       (PusherEvent? e) {
//         print("Event Data is: ${e?.data}");
//         print("Event User Id is: ${e?.userId}");
//         print("Event Channel Name is: ${e?.channelName}");
//         print("Event Name is: ${e?.eventName}");
//       },
//     );
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//     );
//   }
// }
