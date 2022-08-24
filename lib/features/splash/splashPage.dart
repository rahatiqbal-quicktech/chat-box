// ignore_for_file: must_be_immutable

import 'package:chat_box/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:chat_box/features/landing/landing_screen.dart';
import 'package:chat_box/shared/sharedPref/sharedPrefStore.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  String? accessToken;
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    userValidation().whenComplete(() => Future.delayed(Duration(seconds: 3))
        .whenComplete(() => widget.accessToken != null
            ? Get.offAll(BottomNavigationBarScreen())
            : Get.offAll(LandingScreen())));
    super.initState();
  }

  Future userValidation() async {
    var sharedPref = await SharedPreferences.getInstance();

    var _token = sharedPref.getString(accessToken);

    setState(() {
      widget.accessToken = _token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          appLogoIcon,
          height: 100,
        ),
      ),
    );
  }
}
