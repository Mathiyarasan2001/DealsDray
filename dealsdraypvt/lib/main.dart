import 'package:dealsdraypvt/Screens/HomeScreen.dart';
import 'package:dealsdraypvt/Screens/LoginScreen.dart';
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
        home:

            // Homescreen()
            splashScreen()
        //     loginScreen(
        //   deviceId: "66863b1b5120b12d7e1820ee",
        // )
        );
  }
}
