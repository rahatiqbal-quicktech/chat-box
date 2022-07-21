import 'package:flutter/material.dart';

class SubscriptionListTileWidget extends StatelessWidget {
  const SubscriptionListTileWidget({
    required this.name,
    required this.subTitle,
    required this.icon,
    required this.color,
    this.function,
    Key? key,
  }) : super(key: key);

  final String name;
  final String subTitle;
  final IconData icon;
  final Color color;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(name),
      subtitle: Text(subTitle),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
    );
  }
}
