import 'package:chat_box/dummy/dummy_data.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/widgets/subscription_list_tile_widget.dart';

class MySubscriptionsScreen extends StatelessWidget {
  const MySubscriptionsScreen({Key? key}) : super(key: key);

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
          "My Subscriptions",
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
            height: size.height * 30,
            color: Colors.white,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade700,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: size.height * 25,
                    width: size.width * 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "VIP",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const Text("5 VIP Priviliges"),
                        const Spacer(),
                        const Divider(
                          color: Colors.white,
                        ),
                        const VerticalSpace(height: 5),
                        ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(image)),
                          title: const Text(
                            "VIP yet not activated",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          const VerticalSpace(height: 10),
          const SubscriptionListTileWidget(
            name: "Unlimited Likes",
            subTitle: "Send your likes with no limits",
            color: themeColor,
            icon: Icons.favorite,
          ),
          const SubscriptionListTileWidget(
            name: "5 Super Likes A Day",
            subTitle: "You are 5x more likely to get a match",
            color: Colors.blue,
            icon: Icons.star,
          ),
          const SubscriptionListTileWidget(
            name: "Unlimited Rewinds",
            subTitle: "Go back and swipe again",
            color: Colors.orange,
            icon: Icons.refresh,
          ),
          SubscriptionListTileWidget(
            name: "Hide Last Seen",
            subTitle: "Hide your onlnine status",
            color: themeColor.withOpacity(0.5),
            icon: Icons.hide_image,
          ),
          const SubscriptionListTileWidget(
            name: "Ad-free",
            subTitle: "Free from ad",
            color: Colors.yellow,
            icon: Icons.ad_units,
          ),
          SubscriptionListTileWidget(
            name: "Set Alias",
            subTitle: "Make your matches easy to find later",
            color: themeColor.withOpacity(0.7),
            icon: Icons.bookmark,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          // width: size.width * 70,
          height: 70,
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 5),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("BDT 150 Get VIP"),
            style: ElevatedButton.styleFrom(
              primary: themeColor,
            ),
          ),
        ),
      ),
    );
  }
}
