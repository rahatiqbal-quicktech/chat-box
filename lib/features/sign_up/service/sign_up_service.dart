import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chat_box/features/log_in/log_in_screen.dart';
import 'package:chat_box/features/sign_up/sign_up_friends_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart' as http;

class SignUpService {
  signUp({
    required String name,
    required String dob,
    required String password,
    required String phone,
    required String gender,
  }) async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
    );
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
        EasyLoading.dismiss();

        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          getx.Get.to(() => LogInScreen(
                friendsLogin: true,
              ));
          getx.Get.snackbar(
              "Success", "Your account has been created successfully");
        } else {
          getx.Get.snackbar(data["status"].toString(), data["message"]);
        }
      }
    } on Exception catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.toString());
    }
  }

  signUpWithImage({
    required File? profileImage,
    required String name,
    required String number,
    required String password,
    required String gender,
  }) async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
    );
    var dio = Dio();

    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "phone": number,
        "password": password,
        "dob": "2020/5/5",
        "gender": gender,
        "image1": await MultipartFile.fromFile(profileImage!.path),
      });

      var response = await dio.post(
          "http://chatbox.quicksoft.xyz/api/friend/auth/register",
          data: formData);

      if (response.statusCode == 200) {
        EasyLoading.dismiss();

        if (response.data['status'] == true) {
          log(response.data.toString());
          getx.Get.snackbar("Success", "Account created");
          getx.Get.to(() => const SignUpFriendsScreen(friends: true));
        } else {
          getx.Get.snackbar(
              "Something went wrong", "${response.data['message']}");
        }
      }
    } on Exception catch (e) {
      EasyLoading.dismiss();

      getx.Get.snackbar("error", e.toString());
      debugPrint(e.toString());
      print(e);
      log(e.toString());
    }
  }
}
