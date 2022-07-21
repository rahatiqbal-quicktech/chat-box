import 'package:chat_box/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:chat_box/features/sign_up/sign_up_profile_screen.dart';
import 'package:chat_box/shared/widgets/horizontal_space.dart';
import 'package:chat_box/shared/widgets/rounded_button_widget.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
        // backgroundColor: themeColor,
        body: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const VerticalSpace(height: 10),
            const HorizontalSpace(width: double.infinity),
            Image(
              image: const AssetImage(appLogoIcon),
              height: size.height * 10,
            ),
            const VerticalSpace(height: 20),
            const Text(
              "An otp has been sent to your number. \nWrite the number below to verify.",
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "OTP",
              ),
            ),
            const VerticalSpace(height: 10),
            RoundButtonWidget(
              labelText: "Verify OTP",
              icon: Icons.account_box,
              function: () {
                Get.to(() => const SignUpProfileScreen());
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    ));
  }
}
