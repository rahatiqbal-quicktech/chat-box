import 'package:chat_box/all_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/landing/landing_screen.dart';

class MyApp extends StatelessWidget with AllControllers {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingScreen(),
    );
  }
}
