import 'album_bottom_sheet_widget.dart';
import 'bottom_sheet_buttons_widget.dart';
import 'personal_information_text_widget.dart';
import 'package:chat_box/shared/widgets/vertical_space.dart';
import 'package:chat_box/utils/app_config.dart';
import 'package:flutter/material.dart';

class CardBottomSheetWidget extends StatelessWidget {
  const CardBottomSheetWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size.height * 70,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Audrey Hepburn',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(text: ' . '),
                      TextSpan(
                        text: '45',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(height: 5),
                RichText(
                  text: const TextSpan(
                    text: 'Dhaka(7km)',
                    style: TextStyle(
                      color: Colors.grey,
                      // fontSize: 10,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: ' . '),
                      TextSpan(
                        text: 'Active 10 minutes ago',
                        style: TextStyle(
                            // fontSize: 10,
                            ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(height: 15),
                Container(
                  color: themeColor.withOpacity(0.19),
                  child: const ListTile(
                    leading: Icon(Icons.check_box),
                    title: Text("Pick your favourite emoji"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ),
                const VerticalSpace(height: 20),
                AlbumBottomSheetWidget(size: size),
                const VerticalSpace(height: 10),
                const Divider(
                  color: Colors.black,
                ),
                const VerticalSpace(height: 10),
                const Text("Personal Information"),
                const VerticalSpace(height: 20),
                PersonalInformationTextWidget(
                    fieldName: "Star Sign", info: "Pisces", size: size),
                PersonalInformationTextWidget(
                    fieldName: "About Me",
                    info:
                        "Audrey Hepburn, Actress: Breakfast at Tiffany's. Audrey Hepburn was born as Audrey Kathleen Ruston on May 4, 1929 in Ixelles, Brussels, Belgium.",
                    size: size),
                const VerticalSpace(height: 15),
                const Text("Interest"),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 25,
                        child: const Icon(Icons.movie),
                      ),
                      Container(
                        width: size.width * 5,
                      ),
                      Wrap(
                          // direction: Axis.vertical,
                          runSpacing: 20.0,
                          spacing: 15.0,
                          verticalDirection: VerticalDirection.down,
                          children: ["Tennis", "Hiking", "Acting"]
                              .map((e) => Chip(label: Text(e)))
                              .toList())
                    ],
                  ),
                ),
                VerticalSpace(height: size.height * 10),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: BottomSheetButtonsWidget(size: size),
        ),
      ],
    );
  }
}
