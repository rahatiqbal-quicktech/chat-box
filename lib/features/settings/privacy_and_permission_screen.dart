import 'package:chat_box/features/settings/widgets/switch_list_tile.dart';
import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/features/update_profile/widgets/themecolor_text.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class PrivacyAndPermissionScreen extends StatelessWidget {
  const PrivacyAndPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(title: "Privacy & Permission"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          children: const [
            ThemecolorText("Privacy"),
            VerticalSpace(height: 5),
            SwitchListTileCustom(
              name: "Block Phoene Contacts",
              subtitle: "Don't show me toi people on the list",
            ),
            SwitchListTileCustom(
              name: "Mutual Contacts",
              subtitle: "See when you have friends in common",
            ),
            SwitchListTileCustom(
              name: "Hide Membership Badge",
              subtitle: "Stay low-key and hide your membership badge",
            ),
            VerticalSpace(height: 5),
            Divider(),
            VerticalSpace(height: 5),
          ],
        ),
      ),
    );
  }
}
