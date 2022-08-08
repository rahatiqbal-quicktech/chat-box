import 'dart:convert';

import 'package:chat_box/features/log_in/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  signUp({
    required String name,
    required String dob,
    required String password,
    required String phone,
    required String gender,
  }) async {
    try {
      var finalUrl =
          Uri.parse("http://chatbox.quicksoft.xyz/api/friend/auth/register");
      var response = await http.post(
        finalUrl,
        body: {
          "name": name,
          "phone": phone,
          "password": password,
          "dob": "2020/5/5",
          "gender": gender
        },
      );

      if (response.statusCode == 200) {
        debugPrint(response.body);

        var data = jsonDecode(response.body);
        if (data['sattus'] == true) {
          Get.to(() => const LogInScreen(
                friendsLogin: true,
              ));
          Get.snackbar("Success", "Your account has been created successfully");
        }
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
