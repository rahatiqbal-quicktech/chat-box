import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_config.dart';

class AccountBalanceWidget extends StatelessWidget {
  const AccountBalanceWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
      height: size.height * 23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeColor.withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Account Balance",
          ),
          VerticalSpace(height: size.height * 5),
          const Text(
            "Coins",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          // const VerticalSpace(height: 5),
          Row(
            children: [
              const Text(
                "0",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Buy"),
                style: ElevatedButton.styleFrom(
                  primary: themeColor,
                  // padding: EdgeInsets.zero,
                  elevation: 0.1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
