import 'package:flutter/material.dart';

class EditInfoListTile extends StatelessWidget {
  const EditInfoListTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    this.function,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color color;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function!();
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon,
            color: Colors.white,
          )),
      title: RichText(
        text: TextSpan(
            text: "+   ",
            style: TextStyle(color: color, fontSize: 15),
            children: [
              TextSpan(
                  text: text, style: TextStyle(color: Colors.grey.shade500))
            ]),
      ),
    );
  }
}
