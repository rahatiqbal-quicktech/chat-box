import 'dart:io';

import 'package:chat_box/all_controllers.dart';
import 'package:chat_box/features/help/help_center_screen.dart';
import 'package:chat_box/features/settings/settings_screen.dart';
import 'package:chat_box/features/subscription/my_subscriptions_screen.dart';
import 'package:chat_box/features/update_profile/edit_info_screen.dart';
import 'package:chat_box/features/update_profile/upload_profile_image_screen.dart';
import 'package:chat_box/features/wallet/wallet_screen.dart';
import 'package:chat_box/shared/functions/access_token_functions.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget with AllControllers {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          Obx(() {
            return Container(
              height: size.height * 30,
              color: themeColor,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        profileController.profileImageUrl != null
                            ? profileController.profileImageUrl.value
                            : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                        // "$imageBaseUrl/${profileController.mProfile.value.profilePic}",
                      ),
                      backgroundColor: Colors.white,
                      radius: 35,
                    ),
                  ),
                  const VerticalSpace(height: 10),
                  Text(
                    profileController.name.value,
                    // "abcde",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  const VerticalSpace(height: 10),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => EditInfoScreen());
                    },
                    child: Text(
                      profileController.about.value,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }),
          ListTile(
            title: const Text(
              "2000 ❤",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            subtitle: const Text("people like you"),
            trailing: TextButton(
                onPressed: () {},
                child: const Text("Who likes me?",
                    style: TextStyle(
                      color: themeColor,
                    ))),
          ),
          const VerticalSpace(height: 10),
          Container(
            color: themeColor.withOpacity(0.1),
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.paid,
                color: Colors.orange.shade300,
              ),
              title: const Text(
                "My Subscriptions",
              ),
              subtitle: const Text("Unlock VIP with BDT 150/mo only"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
              onTap: () {
                Get.to(() => const MySubscriptionsScreen());
              },
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.wallet_membership,
              color: themeColor,
            ),
            title: const Text(
              "Wallet",
            ),
            subtitle: const Text("Balance : 0 coins"),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            onTap: () {
              Get.to(() => const WalletScreen());
            },
          ),
          const ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.verified,
              color: Colors.blue,
            ),
            title: Text(
              "Verify Your Profile",
            ),
            subtitle: Text("Get your profile verified"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            title: const Text(
              "Settings",
            ),
            subtitle: const Text("Account, privacy and notifications"),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            onTap: () {
              Get.to(() => const SettingsScreen());
            },
          ),
          ListTile(
            onTap: () {
              Get.to(() => const HelpCenterScreen());
            },
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.help,
              color: Colors.orange,
            ),
            title: const Text(
              "Help",
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          ListTile(
            onTap: () {
              // Get.to(() => const HelpCenterScreen());
              AccessTokenFunctions().deleteAccessToken();
            },
            title: const Text(
              "Logout",
            ),
            trailing: const Icon(
              Icons.logout,
              size: 15,
            ),
          ),
        ],
      )),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      updateProfileController.getImageFile(temp.path);
      Get.to(() => UploadProfileImageScreen());
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
