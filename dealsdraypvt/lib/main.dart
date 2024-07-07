import 'package:dealsdraypvt/Screens/BottomNav/HomeScreen.dart';
import 'package:dealsdraypvt/Screens/BottomNav/bottomNavigation.dart';
import 'package:dealsdraypvt/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: splashScreen());
  }
}
