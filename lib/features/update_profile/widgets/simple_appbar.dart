import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar simpleAppbar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: Colors.black),
    ),
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
    ),
    elevation: 0.1,
    backgroundColor: Colors.grey.shade50,
  );
}
