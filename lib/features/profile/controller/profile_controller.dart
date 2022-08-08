import 'package:chat_box/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:chat_box/features/profile/models/m_profile_model.dart';
import 'package:chat_box/features/profile/service/m_profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var name = "".obs;
  var about = "".obs;
  var userId = "".obs;

  // var about = Rxn<String>();

  var mProfile = MProfileModel().obs;

  getUserProfile({
    required String profileName,
    required String id,
    String? profileAbout,
  }) {
    name.value = profileName;
    userId.value = id;
    about.value = profileAbout ?? "Tap to add a cool bio";
  }

  getMProfile({required int id}) async {
    var temp = await MProfileService().getData(id: id);
    debugPrint(temp.toString());
    if (temp != null) {
      mProfile.value = temp;
      getUserProfile(
          profileName: mProfile.value.name.toString(),
          id: mProfile.value.id.toString(),
          profileAbout: mProfile.value.aboutMe);
      Get.to(() => const BottomNavigationBarScreen());
    }
  }
}
