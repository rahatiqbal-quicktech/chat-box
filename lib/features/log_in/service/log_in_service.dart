import 'package:chat_box/all_controllers.dart';
import 'package:chat_box/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:chat_box/features/log_in/model/login_user_model.dart';
import 'package:chat_box/features/profile/service/m_profile_service.dart';
import 'package:chat_box/shared/functions/access_token_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LogInService with AllControllers {
  logIn({required String phone, required String password}) async {
    try {
      var finalUrl =
          Uri.parse("http://chatbox.quicksoft.xyz/api/friend/auth/login");

      var response = await http.post(
        finalUrl,
        body: {"phone": phone, "password": password},
      );

      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body) as Map<String, dynamic>;

        if (data['status'] == true) {
          // var temp = LoginUserModel.fromJson(data);
          profileController.getUserProfile(
            profileName: data["user"]["name"],
            id: data["user"]["id"].toString(),
          );
          AccessTokenFunctions().saveAccessToken(data["access_token"]);

          Get.to(() => const BottomNavigationBarScreen());
        } else {
          Get.snackbar("${data['message']}", "");
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  logInMarriage({required String number, required String password}) async {
    try {
      var finalUrl = Uri.parse(
          "http://chatbox.quicksoft.xyz/api/Marriage-Registration-login");

      var response = await http.post(
        finalUrl,
        body: {"number": number, "password": password},
      );

      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body) as Map<String, dynamic>;

        if (data['status'] == true) {
          // Get.to(() => const BottomNavigationBarScreen());
          // MProfileService().getData(id: data['customer_id']);
          profileController.getMProfile(id: data['customer_id']);
        } else {
          Get.snackbar("${data['message']}", "");
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
