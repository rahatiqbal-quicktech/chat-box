import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/features/update_profile/widgets/themecolor_text.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class AboutChatBoxScreen extends StatelessWidget {
  const AboutChatBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(title: "About Chat Box"),
      body: ListView(
        shrinkWrap: true,
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const HorizontalSpace(width: double.infinity),
          const VerticalSpace(height: 20),
          const Image(
            image: AssetImage(appLogoIcon),
            height: 70,
          ),
          const VerticalSpace(height: 10),
          const Center(child: ThemecolorText("Chat Box")),
          const Center(child: Text("v 1.0.0")),
          const VerticalSpace(height: 350),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {}, child: const Text("Terms and Services")),
              const Text("and"),
              TextButton(onPressed: () {}, child: const Text("Privacy Policy")),
            ],
          ),
        ],
      ),
    );
  }
}
