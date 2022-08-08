import 'package:chat_box/features/sign_up/service/otp_service.dart';
import 'package:chat_box/shared/widgets/horizontal_space.dart';
import 'package:chat_box/shared/widgets/rounded_button_widget.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPhoneScreen extends StatelessWidget {
  const SignUpPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
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
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Phone Number",
                prefix: const Text(
                  "+88  ",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
              ),
            ),
            const VerticalSpace(height: 10),
            RoundButtonWidget(
              labelText: "Login",
              icon: Icons.account_box,
              function: () {
                // Get.to(() => const OtpScreen());
                // SendOtpService().sendOtp(phone: )
                OtpService().sendOtp(phone: phoneController.text);
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
