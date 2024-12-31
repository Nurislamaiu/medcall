import 'package:flutter/cupertino.dart';
import 'package:medcall/navigation_bar.dart';
import 'package:medcall/screens/auth/forget_password/forget_password_screen.dart';
import 'package:medcall/screens/auth/login/login_screen.dart';
import 'package:medcall/screens/auth/on_boarding/on_boarding_screen.dart';
import 'package:medcall/screens/home/home_screen.dart';

import '../screens/auth/register/register_screen.dart';

class AppRoutes {
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String navBar = '/navBar';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onBoarding: (context) => OnboardingScreen(),
      login: (context) => LoginScreen(),
      register: (context) => RegisterScreen(),
      forgotPassword: (context) => ForgotPasswordScreen(),
      navBar: (context) => NavBarScreen(),
      home: (context) => HomeScreen(),
    };
  }
}
