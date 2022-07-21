import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class SelectInterestsScreen extends StatelessWidget {
  const SelectInterestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(title: "Select Interest"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: const Text("Interest"),
                trailing: RoundCheckBox(
                  onTap: (value) {},
                  size: 20,
                  checkedColor: themeColor,
                ),
              );
            }),
      ),
    );
  }
}
