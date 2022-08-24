import 'package:chat_box/all_controllers.dart';
import 'package:chat_box/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:chat_box/shared/functions/access_token_functions.dart';
import 'package:chat_box/utils/service_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LogInService with AllControllers {
  logIn({required String phone, required String password}) async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    try {
      var finalUrl = Uri.parse("$baseUrl/friend/auth/login");

      var response = await http.post(
        finalUrl,
        body: {
          "phone": phone,
          "password": password,
        },
      );

      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body) as Map<String, dynamic>;

        if (data['status'] == true) {
          EasyLoading.dismiss();
          // var temp = LoginUserModel.fromJson(data);
          profileController.getUserProfile(
            profileName: data["user"]["name"],
            id: data["user"]["id"].toString(),
            imageUrl: data["user"]["image1"],
          );

          AllControllers().sharePrefC.saveToken(data["access_token"]);
          AllControllers().sharePrefC.saveUserId(data["user"]["id"]);
          AccessTokenFunctions().saveAccessToken(data["access_token"]);

          Get.to(() => const BottomNavigationBarScreen());
        } else {
          Get.snackbar("${data['message']}", "");
          EasyLoading.dismiss();
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.toString());
    }
  }

  logInMarriage({required String number, required String password}) async {
    try {
      var finalUrl = Uri.parse("$baseUrl/Marriage-Registration-login");

      var response = await http.post(
        finalUrl,
        body: {
          "number": number,
          "password": password,
        },
      );

      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body) as Map<String, dynamic>;

        if (data['status'] == true) {
          // Get.to(() => const BottomNavigationBarScreen());
          // MProfileService().getData(id: data['customer_id']);
          AllControllers().sharePrefC.saveToken(data["access_token"]);
          AllControllers().sharePrefC.saveUserId(data["user"]["id"]); 
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
