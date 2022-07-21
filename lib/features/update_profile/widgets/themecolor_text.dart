import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class ThemecolorText extends StatelessWidget {
  const ThemecolorText(
    this.text, {
    Key? key,
    // required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: themeColor,
      ),
    );
  }
}
