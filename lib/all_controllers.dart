import 'package:chat_box/features/home/controllers/swipeDataController.dart';
import 'package:chat_box/features/profile/controller/profile_controller.dart';
import 'package:chat_box/features/sign_up/controller/sign_up_controller.dart';
import 'package:chat_box/features/story/controller/all_posts_controller.dart';
import 'package:chat_box/features/update_profile/controller/update_profile_controller.dart';
import 'package:chat_box/shared/sharedPref/sharePrefController.dart';
import 'package:get/get.dart';

class AllControllers {
  final signUpController = Get.put(SignUpController());
  final allPostsController = Get.put(AllPostsController());
  final profileController = Get.put(ProfileController());
  final updateProfileController = Get.put(UpdateProfileController());


//new
  final sharePrefC = Get.put(SharedPrefController());
  final swipeDataC = Get.put(SwipeDataController());


}
