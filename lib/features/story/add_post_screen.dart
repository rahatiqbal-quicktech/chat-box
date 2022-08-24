import 'dart:io';

import 'package:chat_box/features/story/service/story_services.dart';
import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key, required this.imageFile}) : super(key: key);
  final File imageFile;

  @override
  Widget build(BuildContext context) {
    TextEditingController captionController = TextEditingController();

    var height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: simpleAppbar(title: "Add a post"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpace(height: 10),
            Image.file(
              imageFile,
              height: height * 20,
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
            const VerticalSpace(height: 15),
            TextField(
              controller: captionController,
              minLines: 5,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Add a caption...",
                border: InputBorder.none,
              ),
            ),
            const VerticalSpace(height: 10),
          ],
        ),
      )),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          StoryServices()
              .postStory(image: imageFile, caption: captionController.text);
        },
        child: Container(
          width: double.infinity,
          height: height * 7,
          color: themeColor,
          child: const Center(
            child: Text(
              "Post",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
