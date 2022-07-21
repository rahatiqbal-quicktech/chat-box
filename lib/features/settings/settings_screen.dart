import 'package:chat_box/features/settings/about_chat_box_screen.dart';
import 'package:chat_box/features/settings/notifications_and_chat.dart';
import 'package:chat_box/features/settings/privacy_and_permission_screen.dart';
import 'package:chat_box/features/update_profile/account_and_security_screen.dart';
import 'package:chat_box/features/settings/data_and_storage_screen.dart';
import 'package:chat_box/features/update_profile/personal_information_screen.dart';
import 'package:chat_box/shared/widgets/subscription_list_tile_widget.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
// import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
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
          "Settings",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            // const VerticalSpace(height: 10),
            const Text(
              "Discovery Settings",
              style: TextStyle(
                color: themeColor,
              ),
            ),
            const VerticalSpace(height: 15),
            const ListTile(
              title: Text("Location"),
              subtitle: Text("Dhaka"),
              trailing: Text(
                "Customize Location",
                style: TextStyle(
                  color: themeColor,
                ),
              ),
            ),
            const ListTile(
              title: Text("Distance"),
              trailing: Text(
                "100 km +",
                style: TextStyle(
                  color: themeColor,
                ),
              ),
            ),
            Slider(
              value: 50,
              max: 100,
              thumbColor: themeColor,
              // label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  // _currentSliderValue = value;
                });
              },
            ),
            ListTile(
              title: const Text("Expand search area"),
              subtitle: const Text("Automatically expand search area"),
              trailing: SizedBox(
                  width: 50,
                  height: 50,
                  child: Switch(
                      activeColor: themeColor,
                      value: checked,
                      onChanged: (value) {
                        setState(() {
                          checked = value;
                        });
                      })),
            ),
            const ListTile(
              title: Text("Show Me"),
              trailing: Text(
                "Both Men and Women",
                style: TextStyle(
                  color: themeColor,
                ),
              ),
            ),
            const ListTile(
              title: Text("Age"),
              trailing: Text("18 - 50 +"),
            ),
            Slider(
              value: 90,
              max: 100,
              thumbColor: themeColor,
              // label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  // _currentSliderValue = value;
                });
              },
            ),
            const Divider(),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.workspace_premium,
              ),
              label: const Text("Privacy Settings"),
              style: TextButton.styleFrom(primary: themeColor),
            ),
            ListTile(
              title: const Text("Hide Last Seen"),
              subtitle: const Text("People can't see when you are online"),
              trailing: Switch(
                  value: checked,
                  activeColor: themeColor,
                  onChanged: (value) {
                    setState(() {
                      checked = value;
                    });
                  }),
            ),
            const Divider(),
            const VerticalSpace(height: 10),

            const Text("App Settings"),
            const VerticalSpace(height: 10),
            SubscriptionListTileWidget(
              name: "Personal Information",
              subTitle: "Edit your name and date of birth",
              icon: Icons.person,
              color: Colors.blue,
              function: () {
                Get.to(() => const PersonalInformationScreen());
              },
            ),
            SubscriptionListTileWidget(
                name: "Privacy and Permission",
                subTitle: "Contacts, my albums and others",
                icon: Icons.handshake,
                color: Colors.orange,
                function: () {
                  Get.to(() => const PrivacyAndPermissionScreen());
                }),
            SubscriptionListTileWidget(
                name: "Notification and Chat",
                subTitle: "Chat and notification settings",
                icon: Icons.message,
                color: Colors.green,
                function: () {
                  Get.to(() => const NotificationsAndChatScreen());
                }),
            SubscriptionListTileWidget(
                name: "Data and Storage",
                subTitle: "Data preference and storage settings",
                icon: Icons.settings,
                color: Colors.grey,
                function: () {
                  Get.to(const DataAndStorage());
                }),
            SubscriptionListTileWidget(
                name: "Account and Security",
                subTitle: "Edit phone number nad password",
                icon: Icons.lock,
                color: Colors.red,
                function: () {
                  Get.to(() => const AccountAndSecurityScreen());
                }),

            const Divider(
              color: Colors.black,
            ),
            SubscriptionListTileWidget(
                name: "About Chat Box",
                subTitle: "More information",
                icon: Icons.abc,
                color: Colors.green,
                function: () {
                  Get.to(() => const AboutChatBoxScreen());
                }),
            const VerticalSpace(height: 15),
            Container(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "RESTORE PURCHASES",
                  style: TextStyle(
                    color: themeColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: themeColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
