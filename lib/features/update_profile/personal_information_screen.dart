import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        title: const Text(
          "Personal Information",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: const [
          VerticalSpace(height: 10),
          ListTile(
            title: Text("Gender"),
            subtitle: Text("Woman"),
          ),
          ListTile(
            title: Text("Full Name"),
            subtitle: Text("Audrey Hepburn"),
          ),
          ListTile(
            title: Text("Birthday"),
            subtitle: Text("15/8/1950"),
          ),
        ],
      )),
    );
  }
}
