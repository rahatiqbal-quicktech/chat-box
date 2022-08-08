import 'package:chat_box/features/landing/landing_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccessTokenFunctions {
  final box = GetStorage();

  saveAccessToken(String token) {
    box.write('accessToken', token);
  }

  deleteAccessToken() {
    box
        .remove('accessToken')
        .then((value) => Get.offAll(() => const LandingScreen()));
  }
}
