import 'package:chat_box/all_controllers.dart';
import 'package:chat_box/features/splash/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget with AllControllers {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    swipeDataC.getSwipeList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      smartManagement: SmartManagement.onlyBuilder,
      builder: EasyLoading.init(),
    );
  }
}
