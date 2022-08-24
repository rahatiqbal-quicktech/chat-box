import 'package:chat_box/features/landing/landing_screen.dart';
import 'package:chat_box/shared/sharedPref/sharedPrefStore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController extends GetxController {
  Future saveToken(token) async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(accessToken, token);
  }

  removeToken() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove(accessToken);
    Get.offAll(LandingScreen());
  }

  Future saveUserId(usersId) async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setInt(userId, usersId);
  }
}
