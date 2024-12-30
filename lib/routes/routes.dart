import 'package:flutter/cupertino.dart';
import 'package:medcall/navigation_bar.dart';
import 'package:medcall/screens/auth/login/login_screen.dart';
import 'package:medcall/screens/auth/on_boarding/on_boarding_screen.dart';

class AppRoutes {
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String navBar = '/navBar';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onBoarding: (context) => OnboardingScreen(),
      login: (context) => LoginScreen(),
      navBar: (context) => NavBarScreen(),
    };
  }
}
