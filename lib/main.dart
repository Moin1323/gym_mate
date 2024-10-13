import 'package:gym_mate/view/dashboard/BottomNavigationBar/BnB.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_mate/view/auth/login/login_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const LoginView(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
