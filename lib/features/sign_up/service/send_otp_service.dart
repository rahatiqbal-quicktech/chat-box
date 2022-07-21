// ignore_for_file: avoid_print

import 'package:chat_box/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:chat_box/features/sign_up/otp_screen.dart';
import 'package:chat_box/utils/service_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpService {
  final String url = "http://chatbox.quicksoft.xyz/api/friend/check";
  final String verifyOtpEndpoint = "/friend/otp-verify";

  sendOtp({required String phone}) async {
    try {
      var finalUrl = Uri.parse(url);
      var response = await http.post(
        finalUrl,
        body: {"phone": phone},
      );

      if (response.statusCode == 200) {
        debugPrint(response.body);
        Get.to(() => const OtpScreen());
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
      if (response.statusCode == 200) {
        print("success");
      }
    } catch (e) {
      print(e);
    }
  }
}
