import 'package:dealsdraypvt/Services/SplashApiServices.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  final Splashapiservices _apiService = Splashapiservices();

  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  _startSplashScreen() async {
    await Future.delayed(Duration(seconds: 3));
    await _apiService.splashapi(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/SplashScreen.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
