import 'dart:convert';

import 'package:chat_box/features/profile/models/m_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MProfileService {
  Future getData({required int id}) async {
    try {
      var url = Uri.parse(
          "http://chatbox.quicksoft.xyz/api/Marriage-Registration-Get-User/$id");

      var response = await http.get(url);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return MProfileModel.fromJson(data);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
