import 'dart:developer';

import 'package:chat_box/all_controllers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpdateProfileService with AllControllers {
  upldateProfile() async {
    // String image = imageFile.path;
    String image = updateProfileController.updatedImageFIle.value.path;
    var id = profileController.mProfile.value.id;

    var url =
        "http://chatbox.quicksoft.xyz/api/Marriage-Registration-Update?id=$id";

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields["name"] = profileController.mProfile.value.name!
      ..fields["number"] = profileController.mProfile.value.number!
      ..files.add(await http.MultipartFile.fromPath("profile_pic", image))
      ..fields["about_me"] = profileController.mProfile.value.aboutMe ?? "";

    var response = await request.send();
    var data = await http.Response.fromStream(response);
    // print(data.body);
    log("update profile response : ${data.body}");

    if (response.statusCode == 200) {
      Get.snackbar("Updated", "Profile Updated");
      log(response.toString());
      profileController.getMProfile(id: id!);
    }
  }
}
