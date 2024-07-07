import 'dart:convert';
import 'package:dealsdraypvt/Screens/OtpScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class loginApiServices {
  Future<void> loginApiRequest(
      String phoneNumber, String deviceId, context) async {
    try {
      final response = await http
          .post(Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/otp"),
              body: jsonEncode(
                {"mobileNumber": phoneNumber, "deviceId": deviceId},
              ),
              headers: {
            'Content-Type': 'application/json;  charset=UTF-8',
          });

      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.statusCode);
        Map<String, dynamic> JsonResponse = jsonDecode(response.body);
        print(JsonResponse);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Otpscreen(
                deviceId: JsonResponse["data"]["deviceId"],
                userId: JsonResponse["data"]["userId"],
              ),
            ));
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
