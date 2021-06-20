import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suisei_shop/translation/app_translation.dart';
import 'package:suisei_shop/theme.dart';
import 'package:suisei_shop/routes.dart';
import 'package:suisei_shop/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DemoGameShop',
      translations: Translation(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'), 
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
