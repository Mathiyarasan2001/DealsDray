import 'dart:convert';
import 'package:dealsdraypvt/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Splashapiservices {
  Future<void> splashapi(context) async {
    try {
      final response = await http.post(
          Uri.parse("http://devapiv4.dealsdray.com/api/v2/user/device/add"),
          body: jsonEncode({
            "deviceType": "andriod",
            "deviceId": "C6179909526098",
            "deviceName": "Samsung-MT200",
            "deviceOSVersion": "2.3.6",
            "deviceIPAddress": "11.433.445.66",
            "lat": 9.9312,
            "long": 76.2673,
            "buyer_gcmid": "",
            "buyer_pemid": "",
            "app": {
              "version": "1.20.5",
              "installTimeStamp": "2022-02-10T12:33:30.696Z",
              "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
              "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
            }
          }),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          });

      if (response.statusCode == 200) {
        print(response.statusCode);
        Map<String, dynamic> JsonResponse = jsonDecode(response.body);
        print(JsonResponse);
        print(JsonResponse["data"]["deviceId"]);
        // return SplashModel.fromJson(JsonResponse);
        String deviceId = JsonResponse["data"]["deviceId"];
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => loginScreen(
                deviceId: deviceId,
              ),
            ));
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception("Error");
    }
  }
}
