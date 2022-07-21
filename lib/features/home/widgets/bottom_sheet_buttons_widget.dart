import 'package:chat_box/shared/widgets/horizontal_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class BottomSheetButtonsWidget extends StatelessWidget {
  const BottomSheetButtonsWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 99,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            spreadRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 45,
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade800,
            ),
            child: Icon(
              Icons.cancel_outlined,
              color: Colors.grey.shade300,
            ),
          ),
          HorizontalSpace(width: size.width * 5),
          Container(
            height: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade800,
            ),
            child: Icon(
              Icons.star_rounded,
              color: Colors.blue.shade400,
            ),
          ),
          HorizontalSpace(width: size.width * 5),
          Container(
            height: 45,
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade800,
            ),
            child: const Icon(
              Icons.favorite,
              color: themeColor,
            ),
          ),
        ],
      ),
    );
  }
}
