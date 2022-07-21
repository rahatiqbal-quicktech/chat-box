import 'package:chat_box/features/update_profile/select_interests_screen.dart';
import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/edit_info_listtile.dart';
import 'widgets/edit_info_select_image_widget.dart';
import 'widgets/themecolor_text.dart';

class EditInfoScreen extends StatelessWidget {
  const EditInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: simpleAppbar(title: "Edit Info"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const VerticalSpace(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EditInfoSelectImageWidget(size: size),
                EditInfoSelectImageWidget(size: size),
                EditInfoSelectImageWidget(size: size),
              ],
            ),
            const VerticalSpace(height: 10),
            const ListTile(
              title: Text("Audrey Hepburn  .  45"),
              subtitle: Text("Active 10 minutes ago"),
            ),
            const VerticalSpace(height: 15),
            const ThemecolorText("About Me"),
            const VerticalSpace(height: 15),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.edit_note),
              title: Text("Describe yourself here"),
            ),
            const VerticalSpace(height: 15),
            const Divider(color: Colors.grey),
            const VerticalSpace(height: 15),
            const ThemecolorText("Personal Info"),
            const VerticalSpace(height: 15),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.backpack),
              title: Text("What industry are you in?"),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.backpack),
              title: Text("What is your job title?"),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.credit_card),
              title: Text("What company do you work for?"),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.home),
              title: Text("Where were you born?"),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.map_outlined),
              title: Text("What places do you usually go to?"),
            ),
            const VerticalSpace(height: 15),
            const Divider(color: Colors.grey),
            const VerticalSpace(height: 5),
            const ThemecolorText("Hashtags"),
            const VerticalSpace(height: 15),
            const EditInfoListTile(
              text: "Add your hashtags",
              icon: Icons.tag,
              color: Colors.blue,
            ),
            const VerticalSpace(height: 15),
            const Divider(color: Colors.grey),
            const VerticalSpace(height: 10),
            const ThemecolorText("Interests"),
            const VerticalSpace(height: 15),
            EditInfoListTile(
              text: "What sports are you into?",
              icon: Icons.sports,
              color: Colors.green,
              function: () {
                Get.to(const SelectInterestsScreen());
              },
            ),
            const EditInfoListTile(
              text: "What music do you like?",
              icon: Icons.music_note,
              color: Colors.orange,
            ),
            const EditInfoListTile(
              text: "What is your favourite food",
              icon: Icons.food_bank,
              color: themeColor,
            ),
            const EditInfoListTile(
              text: "Favourite movies and TV Shows?",
              icon: Icons.tv,
              color: Colors.red,
            ),
            const VerticalSpace(height: 15),
            const Divider(
              color: Colors.grey,
            ),
            const VerticalSpace(height: 15),
            const ThemecolorText("My Answers"),
            const VerticalSpace(height: 15),
            const ListTile(
              leading: Icon(
                Icons.add,
                color: themeColor,
              ),
              title: Text("Add new"),
            ),
            const VerticalSpace(height: 15),
            const Divider(
              color: Colors.grey,
            ),
            const VerticalSpace(height: 15),
            const Text("Chat Box ID"),
            const VerticalSpace(height: 5),
            const Text(
              "12345",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
