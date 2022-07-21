import 'package:flutter/material.dart';

class EditInfoSelectImageWidget extends StatelessWidget {
  const EditInfoSelectImageWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 20,
      width: size.width * 25,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
