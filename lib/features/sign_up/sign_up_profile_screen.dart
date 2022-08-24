import 'dart:io';

import 'package:chat_box/all_controllers.dart';
import 'package:chat_box/features/sign_up/service/sign_up_service.dart';
import 'package:chat_box/features/update_profile/widgets/simple_appbar.dart';
import 'package:chat_box/shared/widgets/rounded_button_widget.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'service/sign_up_service.dart';

class SignUpProfileScreen extends StatefulWidget {
  const SignUpProfileScreen({Key? key}) : super(key: key);

  @override
  State<SignUpProfileScreen> createState() => _SignUpProfileScreenState();
}

class _SignUpProfileScreenState extends State<SignUpProfileScreen>
    with AllControllers {
  int gender = 0;
  String? genderString;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  File? imageFile;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: simpleAppbar(title: "Create your account"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: Image(
                //     image: const AssetImage(appLogoIcon),
                //     height: size.height * 10,
                //   ),
                // ),
                // const VerticalSpace(height: 10),
                // const Center(child: Text("Profile")),
                // const VerticalSpace(height: 20),
                // Container(
                //   height: 110,
                //   width: 100,
                //   decoration: BoxDecoration(
                //     color: Colors.grey,
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                // ),
                Center(
                  child: imageFile == null
                      ? GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 45,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: CircleAvatar(
                            backgroundImage: FileImage(imageFile!),
                            radius: 45,
                          ),
                        ),
                ),
                const VerticalSpace(height: 10),
                const Center(child: Text("Add profile photo")),
                const VerticalSpace(height: 20),
                const Text("Nickname"),
                TextFormField(
                  controller: _nicknameController,
                  decoration: const InputDecoration(hintText: "Nickname"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("Your birthday"),
                TextFormField(
                  controller: _birthdateController,
                  decoration: const InputDecoration(
                      hintText: "Please enter your birthday"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("Select Gender"),
                const VerticalSpace(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 1;
                          genderString = "Male";
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: gender == 1
                              ? themeColor.withOpacity(0.35)
                              : themeColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            gender == 1
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : Container(),
                            Text(
                              "MAN",
                              style: TextStyle(
                                  color: gender == 1
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 2;
                          genderString = "Female";
                          print("${signUpController.phoneNumber}");
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: gender == 2
                              ? themeColor.withOpacity(0.35)
                              : themeColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              gender == 2
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : Container(),
                              Text(
                                "WOMAN",
                                style: TextStyle(
                                    color: gender == 2
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(height: 20),
                const Text("Password"),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: RoundButtonWidget(
                      labelText: "Coninue",
                      icon: Icons.app_registration_rounded,
                      function: () {
                        if (_formKey.currentState!.validate()) {
                          // debugPrint("Validate");

                          // SignUpService().signUp(
                          //     name: _nicknameController.text,
                          //     dob: _birthdateController.text,
                          //     gender: genderString.toString(),
                          //     phone: signUpController.phoneNumber,
                          //     password: passwordController.text);
                          if (imageFile == null) {
                            Get.snackbar("No Image Selected",
                                "Please select a profile image to continue");
                          } else {
                            SignUpService().signUpWithImage(
                                name: _nicknameController.text,
                                number: signUpController.phoneNumber,
                                password: passwordController.text,
                                gender: genderString.toString(),
                                profileImage: imageFile);
                          }
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      setState(() {
        imageFile = temp;
        print(imageFile);
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
