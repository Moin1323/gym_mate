import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; // GetX for state management and navigation
import 'package:gym_mate/res/colors/app_colors.dart';

import 'package:gym_mate/res/getx_localization/languages.dart';
import 'package:gym_mate/res/routes/app_routes.dart';
import 'package:gym_mate/res/theme/theme_controller.dart';
import 'package:gym_mate/view/splash/splash_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize the ThemeController
  Get.put(ThemeController());

  final ThemeController themeController = Get.put(ThemeController());
  // Set initial system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: themeController.themeMode.value == ThemeMode.light
        ? Brightness.dark
        : Brightness.light,
    statusBarColor: AppColors.background,
  ));

  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the ThemeController
    final ThemeController themeController = Get.find();

    return Obx(() => GetMaterialApp(
          title: 'Flutter Demo',
          translations: Languages(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(), // Define your light theme
          darkTheme: ThemeData.dark(), // Define your dark theme
          themeMode: themeController.themeMode.value, // Set theme mode
          home: const SplashView(),
          getPages: AppRoutes.appRoutes(),
        ));
  }
}
