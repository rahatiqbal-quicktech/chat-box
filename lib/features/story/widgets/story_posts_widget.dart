// ignore_for_file: unnecessary_statements

import 'package:chat_box/dummy/dummy_data.dart';
import 'package:chat_box/shared/widgets/horizontal_space.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StoryPostWidget extends StatefulWidget {
  const StoryPostWidget({
    Key? key,
    required this.name,
    required this.caption,
    required this.createdAt,
  }) : super(key: key);
  final String name;
  final String caption;
  final String createdAt;

  @override
  State<StoryPostWidget> createState() => _StoryPostWidgetState();
}

class _StoryPostWidgetState extends State<StoryPostWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(galgadot),
            ),
            title: Text("User Id ${widget.name}"),
            trailing: Text(widget.createdAt),
          ),
          const VerticalSpace(height: 5),
          Text(widget.caption),
          const VerticalSpace(height: 5),
          Image(
            image: NetworkImage(newYorkImage),
          ),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  isLiked == false
                      ? Fluttertoast.showToast(msg: "Liked")
                      : null;
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: const Icon(Icons.favorite),
                label: const Text("Like"),
                style: OutlinedButton.styleFrom(
                  primary: isLiked == true ? themeColor : Colors.black45,
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
    );
  }
}
