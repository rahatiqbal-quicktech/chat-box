import 'dart:async';
import 'dart:io';

import 'package:chat_box/features/story/model/all_post_model_no_ip.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class StoryServices {
  var dio = Dio();

  Future postStory({String? caption, required File image}) async {
    FormData formData = FormData.fromMap({
      "user_id": "1",
      "caption": caption,
      "ip": "103.12.23.36",
      "image": await MultipartFile.fromFile(image.path)
    });
    var response = await dio.post(
        "http://chatbox.quicksoft.xyz/api/friend/post/create",
        data: formData);

    debugPrint(response.data.toString());
  }

  Future<List<AllPostsModelNoIp>?> fetchAllPosts() async {
    try {
      final response =
          await dio.get("http://chatbox.quicksoft.xyz/api/friend/post/index");

      if (response.statusCode == 200) {
        return allPostsModelNoIpFromJson(response.data.toString());
      } else {
        return null;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
