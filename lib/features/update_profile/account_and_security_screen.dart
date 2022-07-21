import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class AccountAndSecurityScreen extends StatelessWidget {
  const AccountAndSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppbar(title: "Account & Security"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            VerticalSpace(height: 5),
            Text(
              "Account Details",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            VerticalSpace(height: 5),
            ListTile(
              title: Text("Phone Number"),
              trailing: Text(
                "01234567891",
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            ListTile(
              title: Text("Update Your Password"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text("Delete your account"),
              trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
