import 'package:chat_box/features/settings/widgets/switch_list_tile.dart';
import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/features/update_profile/widgets/themecolor_text.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class NotificationsAndChatScreen extends StatelessWidget {
  const NotificationsAndChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(title: "Notifications & Chat"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            VerticalSpace(height: 5),
            ThemecolorText("Notifications"),
            VerticalSpace(height: 10),
            SwitchListTileCustom(
                name: "Message Previews", subtitle: "Show message previews"),
            VerticalSpace(height: 10),
            Divider(),
            VerticalSpace(height: 5),
            SwitchListTileCustom(
                name: "Send message", subtitle: "Press entet to send message,")
          ],
        ),
      ),
    );
  }
}
