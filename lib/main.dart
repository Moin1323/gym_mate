import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/getx_localization/languages.dart';
import 'package:gym_mate/res/routes/app_routes.dart';
import 'package:gym_mate/res/theme/app_theme.dart';
import 'package:gym_mate/view/dashboard/bottom_navigation_bar.dart';

import 'firebase_options.dart';

void main() async {
  AppThemes.setSystemUIOverlayStyle();
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.myTheme,
      home: const BottomNavigationbar(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
