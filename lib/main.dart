import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/config/theme/light_theme.dart';
import 'package:uzyio/controller/theme/theme_controller.dart';
import 'package:uzyio/core/bindings/bindings.dart';
import 'package:uzyio/firebase_options.dart';
import 'package:uzyio/view/screens/launch/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(ThemeController());
  runApp(MyApp());
}

//DO NOT REMOVE Unless you find their usage.
String dummyImg =
    'https://images.unsplash.com/photo-1558507652-2d9626c4e67a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [routeObserver], // Add this
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Uzyio',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      // initialRoute: AppLinks.splash_screen,
      // getPages: AppRoutes.pages,
      home: SplashScreen(),
      initialBinding: AuthBindings(),
      // HomeBindings(),
    );
  }
}
