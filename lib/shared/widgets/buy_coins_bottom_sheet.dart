import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

import 'vertical_space.dart';

class BuyCoinsBottomSheet extends StatelessWidget {
  const BuyCoinsBottomSheet({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ListTile(
          leading: Icon(
            Icons.wallet_giftcard,
            color: Colors.white,
          ),
          title: Text(
            "0 Coins",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(10),
          // height: 50,
          child: const Center(
            child: Icon(
              Icons.bolt,
              size: 50,
              color: themeColor,
            ),
          ),
        ),
        const VerticalSpace(height: 20),
        const Text(
          "Turbo",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const VerticalSpace(height: 10),
        const Text(
          "Be seen 10x more for 30 minutes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const VerticalSpace(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                  alignment: Alignment.topLeft, child: Text("Recharge")),
              const VerticalSpace(height: 10),
              SizedBox(
                  height: 70,
                  width: size.width * 90,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "100 Coins",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "BDT 200.00",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  )),
              const VerticalSpace(height: 20),
              SizedBox(
                width: size.width * 80,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Confirm Payment"),
                  style: ElevatedButton.styleFrom(
                    primary: themeColor,
                    elevation: 0.1,
                  ),
                ),
              ),
              const VerticalSpace(height: 5),
              const Text(
                "By topping up, you agree to Coin Purchase Agreement",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
