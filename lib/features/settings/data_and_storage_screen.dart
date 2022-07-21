import 'package:chat_box/features/update_profile/widgets/themecolor_text.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataAndStorage extends StatelessWidget {
  const DataAndStorage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data & Storage",
            style: TextStyle(
              color: Colors.black,
            )),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0.1,
        backgroundColor: Colors.grey.shade50,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            VerticalSpace(height: 10),
            Text(
              "Data",
              style: TextStyle(color: themeColor),
            ),
            VerticalSpace(height: 5),
            ListTile(
              title: Text("Video & Autoplay"),
              subtitle: Text("Cellular & Wi-Fi"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            VerticalSpace(height: 5),
            ListTile(
              title: Text("Preload Media"),
              subtitle: Text("Wi-Fi only"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            VerticalSpace(height: 10),
            ThemecolorText("Cache"),
            VerticalSpace(height: 5),
            ListTile(
              title: Text("Total Cache"),
              trailing: Text("300 kb"),
            ),
            ListTile(
              title: ThemecolorText("Clear Cache"),
            )
          ],
        ),
      ),
    );
  }
}
