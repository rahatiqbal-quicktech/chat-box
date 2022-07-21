import 'package:chat_box/dummy/dummy_data.dart';
import 'package:chat_box/shared/widgets/horizontal_space.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stories",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: size.height * 25,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(image),
                  ),
                  title: const Text("Audrey Hepburn"),
                  trailing: const Icon(Icons.add_a_photo),
                ),
              ],
            ),
          ),
          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundImage: NetworkImage(image),
          //   ),
          //   title: Text("Audrey Hepburn"),
          //   trailing: Text("5/5/2022"),
          // ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(galgadot),
                  ),
                  title: const Text("Gal Gadot"),
                  trailing: const Text("5/5/2022"),
                ),
                const VerticalSpace(height: 5),
                const Text("Had a great day at New York"),
                const VerticalSpace(height: 5),
                Image(
                  image: NetworkImage(newYorkImage),
                ),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        Fluttertoast.showToast(msg: "Liked");
                      },
                      icon: const Icon(Icons.favorite),
                      label: const Text("Like"),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black45,
                      ),
                    ),
                    const HorizontalSpace(width: 15),
                    OutlinedButton.icon(
                      onPressed: () {
                        Fluttertoast.showToast(msg: "Comment");
                      },
                      icon: const Icon(Icons.comment),
                      label: const Text("Comment"),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black45,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
