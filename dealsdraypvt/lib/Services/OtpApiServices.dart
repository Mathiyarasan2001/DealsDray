import 'dart:convert';
import 'package:dealsdraypvt/Screens/BottomNav/bottomNavigation.dart';
import 'package:dealsdraypvt/Screens/CreateAccount.dart';
import 'package:dealsdraypvt/Screens/BottomNav/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class otpApiServices {
  Future<void> otpApi(
      String otp, String deviceId, String userId, context) async {
    try {
      final response = await http.post(
          Uri.parse(
              "http://devapiv4.dealsdray.com/api/v2/user/otp/verification"),
          body:
              jsonEncode({"otp": otp, "deviceId": deviceId, "userId": userId}),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (response.statusCode == 200) {
        print(response.statusCode);
        Map<String, dynamic> JsonResponse = jsonDecode(response.body);
        print(JsonResponse);
        if (JsonResponse["data"]["registration_status"] == "Incomplete") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Createaccount(
                        userId: userId,
                      )));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomnavigationScreen(),
              ));
        }
      } else {
        print(response.body);
      }
    } catch (e) {}
  }
}
