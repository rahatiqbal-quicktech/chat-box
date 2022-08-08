// ignore_for_file: avoid_print

import 'dart:convert' as convert;

import 'package:chat_box/all_controllers.dart';
import 'package:chat_box/features/sign_up/otp_screen.dart';
import 'package:chat_box/features/sign_up/sign_up_profile_screen.dart';
import 'package:chat_box/utils/service_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpService with AllControllers {
  final String url = "http://chatbox.quicksoft.xyz/api/friend/auth/check";
  final String verifyOtpEndpoint = "/friend/auth/otp-verify";

  sendOtp({required String phone}) async {
    try {
      var finalUrl = Uri.parse(url);
      var response = await http.post(
        finalUrl,
        body: {"phone": phone},
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body) as Map<String, dynamic>;
        if (data['status'] != false) {
          signUpController.savePhoneNumber(phone);
          Get.snackbar(
              data['otp'].toString(), "The OTP number is ${data['otp']}");

          debugPrint(response.body);

          Get.to(() => OtpScreen());
        } else {
          debugPrint(response.body);
          Get.snackbar("Invalid",
              "this phone number is either invalid or taken already");
        }
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  verifyOtp({required String phone, required String otp}) async {
    try {
      var finalUrl = Uri.parse(baseUrl + verifyOtpEndpoint);

      var response = await http.post(
        finalUrl,
        body: {"phone": phone, "otp": otp},
      );

      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body) as Map<String, dynamic>;

        if (data['status'] == true) {
          Get.snackbar("${data['status']}", "");
          Get.to(() => const SignUpProfileScreen());
        } else {
          Get.snackbar("${data['status']}", "");
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
