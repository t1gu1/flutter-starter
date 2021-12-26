import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';
import 'package:flutter_starter/controllers/index.dart';
import 'package:flutter_starter/constants/index.dart';
import 'package:flutter_starter/components/index.dart';
import 'package:flutter_starter/helpers/index.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  Get.put<AuthController>(AuthController());
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetBuilder<LanguageController>(
      builder: (languageController) => Loading(
        child: GetMaterialApp(
          translations: Localization(),
          locale: languageController.getLocale, // <- Current locale
          // navigatorObservers: [
          //   // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
          // ],
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fadeIn,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: "/",
          getPages: AppRoutes.routes,
        ),
      ),
    );
  }
}
