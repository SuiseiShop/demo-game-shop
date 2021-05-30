import 'package:flutter/material.dart';
import 'package:demo_game_shop/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DemoGameShop',
      initialRoute: 'home_screen',
      routes: { 
        'home_screen'  : ( _ ) => HomeScreen(), 
      },
    );
  }
}
