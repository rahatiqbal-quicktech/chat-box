import 'dart:io';

import 'package:chat_box/all_controllers.dart';
import 'package:chat_box/dummy/dummy_data.dart';
import 'package:chat_box/features/story/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/story_posts_widget.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with AllControllers {
  File? imageFile;
  @override
  void initState() {
    super.initState();
    allPostsController.getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stories",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: size.height * 25,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(image),
                  ),
                  title: const Text("Audrey Hepburn"),
                  trailing: IconButton(
                      onPressed: () {
                        pickImage();
                      },
                      icon: const Icon(Icons.add_a_photo)),
                ),
              ],
            ),
          ),

          Obx(() {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: allPostsController.allPosts.length,
                itemBuilder: (context, index) {
                  return StoryPostWidget(
                      name: "${allPostsController.allPosts[index].id}",
                      caption: "${allPostsController.allPosts[index].caption}",
                      createdAt:
                          "${allPostsController.allPosts[index].createdAt}");
                });
          })
          // ListView.builder(
          //     shrinkWrap: true,
          //     primary: false,
          //     // scrollDirection: Axis.vertical,
          //     itemCount: 5,
          //     itemBuilder: (context, index) {
          //       return const StoryPostWidget(
          //           name: "Gal Gadot",
          //           caption: "A great day at New York",
          //           createdAt: "20/20/2022");
          //     }),
        ],
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      this.imageFile = temp;
      Get.to(() => AddPostScreen(imageFile: this.imageFile!));
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
