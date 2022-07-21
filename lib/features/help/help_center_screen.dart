import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title: const Text(
          "Help Center",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: size.height * 20,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    themeColor.withOpacity(0.7),
                    themeColor.withOpacity(0.05)
                  ]),
            ),
            // color: themeColor.withOpacity(0.2),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: size.height * 10,
                    child: Image.asset(appLogoIcon),
                  ),
                ),
                const VerticalSpace(height: 5),
                const Text(
                  "1.0.0",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          const HelpCenterListTileWidget(tileName: "How to swipe and match?"),
          const HelpCenterListTileWidget(tileName: "How do I edit my profile?"),
          const HelpCenterListTileWidget(
              tileName: "I'm out of profiles to swipe through?"),
          const HelpCenterListTileWidget(tileName: "How to get more likes?"),
          const HelpCenterListTileWidget(tileName: "How to get more matches?"),
          const HelpCenterListTileWidget(tileName: "How to break the ice?"),
        ],
      ),
    );
  }
}

class HelpCenterListTileWidget extends StatelessWidget {
  const HelpCenterListTileWidget({
    Key? key,
    required this.tileName,
  }) : super(key: key);

  final String tileName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tileName),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }
}
