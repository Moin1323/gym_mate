import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/getx_localization/languages.dart';
import 'package:gym_mate/res/routes/app_routes.dart';
import 'package:gym_mate/res/theme/app_theme.dart';
import 'package:gym_mate/view/dashbord/home/Exercieses/cardio_exercise_view.dart';

void main() {
  runApp(const MyApp());
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
      home: const CardioExersiseView(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
