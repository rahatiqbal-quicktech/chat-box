import 'package:chat_box/features/story/model/all_post_model_no_ip.dart';
import 'package:chat_box/features/story/service/story_services.dart';
import 'package:get/get.dart';

class AllPostsController extends GetxController {
  var allPosts = <AllPostsModelNoIp>[].obs;

  getAllPosts() async {
    var temp = await StoryServices().fetchAllPosts();
    print("allpost controller $temp");
    if (temp != null) {
      allPosts.value = temp;
    }
  }
}
