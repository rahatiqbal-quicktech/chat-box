import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class SwitchListTileCustom extends StatefulWidget {
  const SwitchListTileCustom({
    Key? key,
    required this.name,
    required this.subtitle,
  }) : super(key: key);
  final String name;
  final String subtitle;

  @override
  State<SwitchListTileCustom> createState() => _SwitchListTileCustomState();
}

class _SwitchListTileCustomState extends State<SwitchListTileCustom> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      subtitle: Text(widget.subtitle),
      trailing: SizedBox(
          width: 50,
          height: 50,
          child: Switch(
              activeColor: themeColor,
              value: checked,
              onChanged: (value) {
                setState(() {
                  checked = value;
                });
              })),
    );
  }
}
