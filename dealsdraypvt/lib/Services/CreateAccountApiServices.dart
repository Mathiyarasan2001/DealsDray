import 'dart:convert';

import 'package:dealsdraypvt/Screens/BottomNav/HomeScreen.dart';
import 'package:dealsdraypvt/Screens/BottomNav/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateNewUserApiServices {
  Future<void> newApiRequest(String email, String password,
      String referrralCode, String userId, context) async {
    try {
      final response = await http.post(
          Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/email/referral"),
          body: jsonEncode({
            "email": email,
            "password": password,
            "referralCode": int.parse(referrralCode) ?? 12345678 ?? "",
            "userId": userId
          }),
          headers: {
            'Content-Type': 'application/json;  charset=UTF-8',
          });

      if (response.statusCode == 200) {
        print(response.statusCode);
        Map<String, dynamic> JsonResponse = jsonDecode(response.body);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomnavigationScreen(),
            ));
      } else {
        print(response.body);
      }
    } catch (e) {}
  }
}
