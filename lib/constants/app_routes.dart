import 'package:get/get.dart';
import 'package:flutter_starter/screens/index.dart';
import 'package:flutter_starter/screens/auth/index.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/sign-in', page: () => SignInScreen()),
    GetPage(name: '/sign-up', page: () => SignUpScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/settings', page: () => SettingsScreen()),
    GetPage(name: '/reset-password', page: () => ResetPasswordScreen()),
    GetPage(name: '/update-profile', page: () => UpdateProfileScreen()),
  ];
}
