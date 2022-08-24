import 'package:chat_box/all_controllers.dart';
import 'package:chat_box/features/update_profile/service/update_profile_service.dart';
import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/shared/widgets/rounded_button_widget.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadProfileImageScreen extends StatelessWidget with AllControllers {
  UploadProfileImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(title: "Update Profile Image"),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            const VerticalSpace(height: 20),
            Image.file(
              updateProfileController.updatedImageFIle.value,
              height: Get.height / 2.1,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            const VerticalSpace(height: 20),
            RoundButtonWidget(
              labelText: "Update",
              icon: Icons.update,
              function: () {
                UpdateProfileService().upldateProfile();
              },
            ),
          ],
        ),
      ),
    );
  }
}
