import 'dart:developer';
import 'dart:io';

import 'package:chat_box/features/sign_up/sign_up_friends_screen.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as getx;

class SignUpMarriageService {
  var dio = Dio();

  signUpMarriage({
    File? profileImage,
    required String name,
    required String number,
    required String password,
    required String permanentAddress,
    required String presentAddress,
    required String educationalStatus,
    required String familyMember,
    required String monthlyIncome,
    required String height,
    required String color,
    required String homeDistrict,
    required String aboutMe,
    File? nidCardImage,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "number": number,
        // "nid_card": await MultipartFile.fromFile(nidCardImage!.path),
        // "profile_pic": await MultipartFile.fromFile(profileImage!.path),
        "permanent_address": permanentAddress,
        "educational_status": educationalStatus,
        "family_member": familyMember,
        "home_districts": homeDistrict,
        "monthly_income": monthlyIncome,
        "height": height,
        "color": color,
        "present_address": presentAddress,
        "work_type": "work_type",
        "password": password,
        "about_me": aboutMe
      });

      var response = await dio.post(
          "http://chatbox.quicksoft.xyz/api/Marriage-Registration",
          data: formData);

      if (response.statusCode == 200) {
        if (response.data['status'] == true) {
          getx.Get.snackbar("Success", "${response.data['message']}");
          getx.Get.to(() => const SignUpFriendsScreen(friends: false));
        } else {
          getx.Get.snackbar(
              "Something went wrong", "${response.data['message']}");
        }
      }
    } on Exception catch (e) {
      getx.Get.snackbar("error", e.toString());
      debugPrint(e.toString());
      print(e);
      log(e.toString());
    }
  }

  signUpUsingHttp() async {
    Map<String, dynamic> bodyData = {
      "number": "01794163235",
      "password": "123456",
    };

    var url =
        Uri.parse("http://chatbox.quicksoft.xyz/api/Marriage-Registration");

    var response = await http.post(url, body: bodyData);
    print(response.body);
    getx.Get.snackbar("http response", response.body);
  }
}


     // FormData formData = FormData.fromMap({
      //   "name": name,
      //   "number": number,
      //   "nid_card": await MultipartFile.fromFile(nidCardImage!.path),
      //   "profile_pic": await MultipartFile.fromFile(profileImage!.path),
      //   "permanent_address": permanentAddress,
      //   "educational_status": educationalStatus,
      //   "family_member": familyMember,
      //   "home_districts": homeDistrict,
      //   "monthly_income": monthlyIncome,
      //   "height": height,
      //   "color": color,
      //   "present_address": presentAddress,
      //   "work_type": "work_type",
      //   "image1": "image/1659594266.img_avatar2.png",
      //   "image2": "image/1659594266.img_avatar2.png",
      //   "image3": "image/1659594266.img_avatar2.png",
      //   "image4": "image/1659594266.img_avatar2.png",
      //   "interested": "interested",
      //   "password": password,
      //   "about_me": aboutMe
      // });