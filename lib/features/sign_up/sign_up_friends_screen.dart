import 'package:chat_box/features/log_in/log_in_screen.dart';
import 'package:chat_box/features/sign_up/sign_up_marriage_screen.dart';
import 'package:chat_box/features/sign_up/sign_up_phone_screen.dart';
import 'package:chat_box/features/sign_up/sign_up_profile_screen.dart';
import 'package:chat_box/shared/widgets/horizontal_space.dart';
import 'package:chat_box/shared/widgets/rounded_button_widget.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class SignUpFriendsScreen extends StatefulWidget {
  const SignUpFriendsScreen({Key? key, required this.friends})
      : super(key: key);
  final bool friends;

  @override
  State<SignUpFriendsScreen> createState() => _SignUpFriendsScreenState();
}

class _SignUpFriendsScreenState extends State<SignUpFriendsScreen> {
  // final Color _color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      // backgroundColor: themeColor,
      body: SafeArea(
          child: Container(
        color: themeColor.withOpacity(0.05),
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
            VerticalSpace(height: size.height * 40),
            RoundButtonWidget(
                labelText: "Login with phone",
                icon: Icons.phone,
                function: () {
                  Get.to(() => LogInScreen(
                        friendsLogin: widget.friends,
                      ));
                }),
            const VerticalSpace(height: 5),
            RoundButtonWidget(
                labelText: "Create an account",
                icon: Icons.edit,
                function: () {
                  if (widget.friends == true) {
                    Get.to(() => SignUpPhoneScreen());
                  } else {
                    Get.to(const SignUpMarriageProfileScreen());
                  }
                }),
          ],
        ),
      )),
    );
  }
}
