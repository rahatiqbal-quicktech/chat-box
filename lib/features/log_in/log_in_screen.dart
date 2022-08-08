import 'package:chat_box/features/log_in/service/log_in_service.dart';
import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/shared/widgets/rounded_button_widget.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key, required this.friendsLogin}) : super(key: key);
  final bool friendsLogin;

  @override
  Widget build(BuildContext context) {
    //
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    TextEditingController phoneController = TextEditingController();
    TextEditingController passWordController = TextEditingController();

    return Scaffold(
      appBar: simpleAppbar(title: "Log In to your account"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          children: [
            const VerticalSpace(height: 10),
            Image(
              image: const AssetImage(appLogoIcon),
              height: height * 10,
            ),
            const VerticalSpace(height: 20),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Phone Number",
                  prefix: const Text("+88  ",
                      style: TextStyle(
                        color: Colors.grey,
                      ))),
            ),
            const VerticalSpace(height: 10),
            TextFormField(
              controller: passWordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Password",
              ),
            ),
            const VerticalSpace(height: 10),
            RoundButtonWidget(
              labelText: "Login",
              icon: Icons.account_box,
              function: () {
                friendsLogin == true
                    ? LogInService().logIn(
                        phone: phoneController.text,
                        password: passWordController.text)
                    : LogInService().logInMarriage(
                        number: phoneController.text,
                        password: passWordController.text);
              },
              width: double.infinity,
            ),
          ],
        ),
      )),
    );
  }
}
