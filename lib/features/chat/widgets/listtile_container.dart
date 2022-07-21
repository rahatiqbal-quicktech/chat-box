import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class ListTileContainer extends StatelessWidget {
  const ListTileContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: Colors.yellow.shade700,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: FractionallySizedBox(
          heightFactor: 0.9, // Adjust those two for the white space
          widthFactor: 0.9,
          child: Container(
            decoration: const BoxDecoration(
              color: themeColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "50+",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
