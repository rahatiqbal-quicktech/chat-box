import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class SelectGenderWidget extends StatefulWidget {
  const SelectGenderWidget({Key? key}) : super(key: key);

  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  int? gender;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              gender = 1;
            });
          },
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: gender == 1
                  ? themeColor.withOpacity(0.35)
                  : themeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                gender == 1
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : Container(),
                Text(
                  "MAN",
                  style: TextStyle(
                      color: gender == 1 ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              gender = 2;
            });
          },
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: gender == 2
                  ? themeColor.withOpacity(0.35)
                  : themeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  gender == 2
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : Container(),
                  Text(
                    "WOMAN",
                    style: TextStyle(
                        color: gender == 2 ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
