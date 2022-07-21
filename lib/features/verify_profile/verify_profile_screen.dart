import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyProfileScreen extends StatelessWidget {
  const VerifyProfileScreen({Key? key}) : super(key: key);

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
          "Verify your profile",
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
          const VerticalSpace(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black45,
              ),
            ),
          )
        ],
      ),
    );
  }
}
