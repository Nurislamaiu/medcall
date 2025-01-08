import 'package:flutter/cupertino.dart';
import 'package:medcall/navigation_bar.dart';
import 'package:medcall/screens/auth/forget_password/forget_password_screen.dart';
import 'package:medcall/screens/auth/login/login_screen.dart';
import 'package:medcall/screens/auth/on_boarding/on_boarding_screen.dart';
import 'package:medcall/screens/home/home_screen.dart';

import '../screens/auth/register/register_screen.dart';
import '../screens/home/screens/consultation/consultation_screen.dart';
import '../screens/home/screens/consultation/screens/knowledge/knowledge_screen.dart';
import '../screens/home/screens/consultation/screens/request_consultation/request_consultation_screen.dart';
import '../screens/home/screens/massage_services_screen.dart';
import '../screens/home/screens/services_screen.dart';
import '../screens/requests/requests_screen.dart';
import '../screens/requests/screens/requests_accepted/requests_accepted_screen.dart';
import '../screens/requests/screens/requests_new/requests_new_screen.dart';
import '../screens/settings/team_screen.dart';
import '../screens/settings/user_agreement_screen.dart';
import '../screens/settings/user_privacy_policy_screen.dart';
import '../screens/settings/user_settings_screen.dart';
import '../screens/settings/we_social_media_screen.dart';

class AppRoutes {
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String navBar = '/navBar';
  static const String home = '/home';
  static const String service = '/service';
  static const String massageService = '/massageService';
  static const String consultation = '/consultation';
  static const String knowledge = '/knowledge';
  static const String requestConsultation = '/requestConsultation';
  static const String requests = '/requests';
  static const String requestsNew = '/requestsNew';
  static const String settings = '/settings';
  static const String agreement = '/agreement';
  static const String privacyPolicy = '/privacy-policy';
  static const String weSocialMedia = '/we-social-media';
  static const String team = '/team';
  static const String profileEdit = '/profile-edit';
  static const String requestsAccept = '/requestsAccept';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onBoarding: (context) => OnboardingScreen(),
      login: (context) => LoginScreen(),
      register: (context) => RegisterScreen(),
      forgotPassword: (context) => ForgotPasswordScreen(),
      navBar: (context) => NavBarScreen(),
      home: (context) => HomeScreen(),
      service: (context) => ServiceScreen(),
      massageService: (context) => MassageServiceScreen(),
      consultation: (context) => ConsultationScreen(),
      knowledge: (context) => KnowledgeBaseScreen(),
      requestConsultation: (context) => RequestConsultationScreen(),
      requests: (context) => RequestScreen(),
      requestsNew: (context) => RequestNewScreen(),
      settings: (context) => UserSettingsScreen(),
      agreement: (context) => UserAgreementScreen(),
      privacyPolicy: (context) => UserPrivacyPolicyScreen(),
      weSocialMedia: (context) => WeSocialMedia(),
      team: (context) => TeamScreen(),
      requestsAccept: (context) => RequestsAcceptedScreen(),
    };
  }
}
