import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class SignUpProfileScreen extends StatelessWidget {
  const SignUpProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: const AssetImage(appLogoIcon),
                height: size.height * 10,
              ),
            ),
            const VerticalSpace(height: 15),
            const Center(child: Text("Profile")),
            const VerticalSpace(height: 15),
            const Text("Nickname"),
            TextFormField(
              decoration: const InputDecoration(hintText: "Nickname"),
            ),
            const VerticalSpace(height: 15),
            const Text("Your birthday"),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: "Please enter your birthday"),
            ),
          ],
        ),
      )),
    );
  }
}
