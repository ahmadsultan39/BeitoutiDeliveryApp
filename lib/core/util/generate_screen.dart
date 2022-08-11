import 'package:beitouti_delivery/features/current_delivery/presentation/pages/current_delivery_page.dart';
import 'package:beitouti_delivery/features/home/presentation/pages/home_page.dart';
import 'package:beitouti_delivery/features/order/presentation/pages/order_page.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class GenerateScreen {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String name = value.name ?? '';
    debugPrint("the name is $name");
    switch (name) {
      case NameScreen.splashScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const SplashPage(),
          );
        }
      case NameScreen.authScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const AuthPage(),
          );
        }
      case NameScreen.homeScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const HomePage(),
          );
        }
      case NameScreen.currentDeliveryScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const CurrentDeliveryPage(),
          );
        }
      case NameScreen.orderScreen:
        {
          return MaterialPageRoute(
            builder: (_) => OrderPage(orderId: value.arguments as int),
          );
        }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

class NameScreen {
  static const String splashScreen = "/";
  static const String authScreen = "/auth";
  static const String homeScreen = "/home";
  static const String currentDeliveryScreen = "/current-delivery";
  static const String orderScreen = "/order";
}
