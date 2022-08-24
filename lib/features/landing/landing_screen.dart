import 'package:chat_box/features/sign_up/sign_up_friends_screen.dart';
import 'package:chat_box/shared/widgets/horizontal_space.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  // final bool friend;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      // backgroundColor: themeColor,
      body: SafeArea(
          child: Column(
        // shrinkWrap: true,
        // primary: false,
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HorizontalSpace(width: double.infinity),
          const VerticalSpace(height: 20),
          Image(
            image: const AssetImage(appLogoIcon),
            height: size.height * 15,
          ),
          const VerticalSpace(height: 8),
          Image(
            image: const AssetImage(appLogoText),
            height: size.height * 5,
          ),
          const VerticalSpace(height: 20),
          const Text(
            "10,45,25,585 matches made",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          VerticalSpace(height: size.height * 20),
          SizedBox(
            width: 150,
            child: OutlinedButton.icon(
              onPressed: () {
                Get.to(
                  () => const SignUpFriendsScreen(friends: true),
                  transition: transition,
                );
              },
              label: const Text('Friends'),
              icon: const Icon(Icons.accessibility),
              style: OutlinedButton.styleFrom(
                primary: themeColor,
                shape: const StadiumBorder(),
                // side: BorderSide(),
              ),
            ),
          ),
          const VerticalSpace(height: 10),
          SizedBox(
            width: 150,
            child: OutlinedButton.icon(
              onPressed: () {
                Get.to(
                  () => const SignUpFriendsScreen(friends: false),
                  transition: Transition.rightToLeftWithFade,
                );
              },
              label: const Text('Marriage'),
              icon: const Icon(Icons.format_align_justify_rounded),
              style: OutlinedButton.styleFrom(
                primary: themeColor,
                shape: const StadiumBorder(),
                // side: BorderSide(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
