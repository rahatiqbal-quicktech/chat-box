import 'dart:io';

import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  var updatedImageFIle = File("").obs;

  getImageFile(String path) {
    updatedImageFIle.value = File(path);
  }
}
