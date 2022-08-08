import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageWidget extends StatefulWidget {
  const SelectImageWidget({Key? key}) : super(key: key);

  @override
  State<SelectImageWidget> createState() => _SelectImageWidgetState();
}

class _SelectImageWidgetState extends State<SelectImageWidget> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickImage();
      },
      child: Container(
        height: 100,
        width: Get.width / 4.5,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: imageFile == null
            ? const Center(
                child: Icon(Icons.add_a_photo),
              )
            : Image.file(imageFile!),
      ),
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
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
