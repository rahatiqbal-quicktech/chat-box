import 'package:chat_box/dummy/dummy_data.dart';
import 'package:chat_box/features/chat/widgets/listtile_container.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  final chloeImage =
      "https://thumbs.dreamstime.com/z/chloe-grace-moretz-santa-monica-ca-february-film-independent-spirit-awards-picture-paul-smith-featureflash-166542861.jpg";
  final String randomImage =
      "https://st2.depositphotos.com/2783505/8226/i/600/depositphotos_82263850-stock-photo-passport-picture-of-a-young.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: null,
        elevation: 0.1,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          const VerticalSpace(height: 10),
          ListTile(
            leading: const ListTileContainer(),
            title: const Text("Someone is waiting for your response"),
            subtitle: const Text("Tap to know"),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text("Reveal"),
              style: ElevatedButton.styleFrom(
                primary: themeColor,
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 23,
            ),
            title: const Text("Audrey Hepburn"),
            subtitle: const Text("message"),
            trailing: Text(
              "5 days ago",
              style: TextStyle(color: themeColor.withOpacity(0.5)),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chloeImage),
              radius: 23,
            ),
            title: const Text("Chloe"),
            subtitle: const Text("message"),
            trailing: Text(
              "5 days ago",
              style: TextStyle(color: themeColor.withOpacity(0.5)),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(randomImage),
              radius: 23,
            ),
            title: const Text("Hilarry Clinton"),
            subtitle: const Text("message"),
            trailing: Text(
              "2 days ago",
              style: TextStyle(color: themeColor.withOpacity(0.5)),
            ),
          ),
          // ListView.builder(
          //     shrinkWrap: true,
          //     primary: false,
          //     itemCount: 5,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         leading: CircleAvatar(
          //           backgroundImage: NetworkImage(image),
          //           radius: 23,
          //         ),
          //         title: const Text("Audrey Hepburn"),
          //         subtitle: const Text("message"),
          //         trailing: Text(
          //           "5 days ago",
          //           style: TextStyle(color: themeColor.withOpacity(0.5)),
          //         ),
          //       );
          //     })
        ],
      )),
    );
  }
}
