import 'dart:developer';
import 'dart:io';

import 'package:chat_box/features/sign_up/service/sign_up_marriage_service.dart';
import 'package:chat_box/features/sign_up/service/sign_up_service.dart';
import 'package:chat_box/features/sign_up/widgets/select_image_widget.dart';
import 'package:chat_box/features/update_profile/widgets/themecolor_text.dart';
import 'package:chat_box/shared/widgets/horizontal_space.dart';
import 'package:chat_box/shared/widgets/rounded_button_widget.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/select_gender.dart';

class SignUpMarriageProfileScreen extends StatefulWidget {
  const SignUpMarriageProfileScreen({Key? key}) : super(key: key);

  @override
  State<SignUpMarriageProfileScreen> createState() =>
      _SignUpMarriageProfileScreenState();
}

class _SignUpMarriageProfileScreenState
    extends State<SignUpMarriageProfileScreen> {
  int gender = 0;
  final _formKey = GlobalKey<FormState>();
  File? imageFile;
  File? nidImageFile;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController famillyMemberController = TextEditingController();
  TextEditingController presentAddressController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController homeDistrictController = TextEditingController();
  TextEditingController monthlyIncomeController = TextEditingController();
  TextEditingController heihgtController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
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
                Center(
                  child: Image(
                    image: const AssetImage(appLogoIcon),
                    height: size.height * 10,
                  ),
                ),
                // const VerticalSpace(height: 20),
                // ListTile(
                //   leading: imageFile != null
                //       ? CircleAvatar(
                //           backgroundImage: FileImage(imageFile!),
                //           radius: 50,
                //         )
                //       : const CircleAvatar(
                //           backgroundColor: Colors.white,
                //           radius: 40,
                //           backgroundImage: NetworkImage(
                //             'https://static.thenounproject.com/png/187803-200.png',
                //           ),
                //         ),
                // ),
                // imageFile == null
                //     ? Row(
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               pickImage();
                //             },
                //             child: const CircleAvatar(
                //               backgroundColor: Colors.white,
                //               radius: 40,
                //               backgroundImage: NetworkImage(
                //                 'https://static.thenounproject.com/png/187803-200.png',
                //               ),
                //             ),
                //           ),
                //           // const Spacer(),
                //           const HorizontalSpace(width: 25),
                //           const Icon(Icons.add),
                //           const HorizontalSpace(width: 5),
                //           const Text("Add a profile photo"),
                //         ],
                //       )
                //     : Row(
                //         children: [
                //           CircleAvatar(
                //             backgroundImage: FileImage(imageFile!),
                //             radius: 50,
                //           ),
                //           const HorizontalSpace(width: 20),
                //           GestureDetector(
                //               onTap: () {
                //                 pickImage();
                //               },
                //               child: const ThemecolorText("Change")),
                //         ],
                //       ),
                const VerticalSpace(height: 20),
                const Text("Nickname"),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Nickname"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("Phone"),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(hintText: "Phone Number"),
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
                const SelectGenderWidget(),
                const VerticalSpace(height: 20),
                const Text("Password"),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("About yourself"),
                TextFormField(
                  controller: aboutMeController,
                  decoration: const InputDecoration(
                      hintText: "Tell about yourself in short"),
                  maxLines: 3,
                  minLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("Add 4 more images"),
                const VerticalSpace(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SelectImageWidget(),
                    SelectImageWidget(),
                    SelectImageWidget(),
                    SelectImageWidget(),
                  ],
                ),
                const VerticalSpace(height: 20),
                const Text("NID Card"),
                const VerticalSpace(height: 10),
                nidImageFile == null
                    ? ElevatedButton.icon(
                        onPressed: () {
                          pickNidImage();
                        },
                        icon: const Icon(Icons.verified),
                        label: const Text("Add NID"),
                        style: ElevatedButton.styleFrom(
                          primary: themeColor,
                        ),
                      )
                    : ListTile(
                        leading: SizedBox(
                            height: 70, child: Image.file(nidImageFile!)),
                        trailing: ElevatedButton(
                          onPressed: () {
                            pickNidImage();
                          },
                          child: const Text("Change NID Image"),
                          style: ElevatedButton.styleFrom(primary: themeColor),
                        ),
                      ),
                const VerticalSpace(height: 20),
                const Text("Present Address"),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Present Address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("Permanent Address"),
                TextFormField(
                  controller: permanentAddressController,
                  decoration:
                      const InputDecoration(hintText: "Permanent Address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("Home District"),
                TextFormField(
                  controller: homeDistrictController,
                  decoration: const InputDecoration(hintText: "Home District"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("Monthly Income"),
                TextFormField(
                  controller: monthlyIncomeController,
                  decoration: const InputDecoration(hintText: "Monthly Income"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("Height"),
                TextFormField(
                  controller: heihgtController,
                  decoration: const InputDecoration(hintText: "Height"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const Text("Color"),
                TextFormField(
                  controller: colorController,
                  decoration: const InputDecoration(hintText: "Color"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field empty';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(height: 20),
                const VerticalSpace(height: 10),
                // TextButton.icon(
                //   onPressed: () {
                //     setState(() {
                //       _icon = Icons.check_box;
                //     });
                //   },
                //   icon: Icon(
                //     _icon,
                //     size: 15,
                //   ),
                //   label: const Text(
                //     "I have read and agree to the Privacy Policy",
                //     style: TextStyle(
                //       color: Colors.grey,
                //     ),
                //   ),
                // ),
                ElevatedButton(
                    onPressed: () {
                      SignUpMarriageService().signUpUsingHttp();
                    },
                    child: const Text("Sign Up")),
                SizedBox(
                  width: double.infinity,
                  child: RoundButtonWidget(
                      labelText: "Coninue",
                      icon: Icons.app_registration_rounded,
                      function: () {
                        // if (_formKey.currentState!.validate()) {
                        // debugPrint("Validate");
                        // SignUpService().signUp();
                        // Get.to(() => const BottomNavigationBarScreen());
                        if (imageFile == null || nidImageFile == null) {
                          Get.snackbar("Nid and rofile photo required",
                              "You need to provide both NID photo and your profile photo.");
                        } else {
                          // print("abcde");
                          log("abcde");
                          SignUpMarriageService().signUpMarriage(
                            profileImage: imageFile,
                            name: nameController.text,
                            number: phoneController.text,
                            password: passwordController.text,
                            color: colorController.text,
                            familyMember: famillyMemberController.text,
                            educationalStatus: "",
                            height: heihgtController.text,
                            monthlyIncome: monthlyIncomeController.text,
                            permanentAddress: permanentAddressController.text,
                            presentAddress: presentAddressController.text,
                            homeDistrict: homeDistrictController.text,
                            nidCardImage: nidImageFile,
                            aboutMe: aboutMeController.text,
                          );
                        }
                        // }
                      }),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  IconData _icon = Icons.check_box_outline_blank;
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

  Future pickNidImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final temp = File(image.path);
      setState(() {
        nidImageFile = temp;
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
