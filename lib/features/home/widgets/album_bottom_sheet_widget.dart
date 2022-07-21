import 'package:chat_box/dummy/dummy_data.dart';
import 'package:flutter/material.dart';

class AlbumBottomSheetWidget extends StatelessWidget {
  const AlbumBottomSheetWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: const Text("Album"),
      trailing: SizedBox(
        width: size.width * 45,
        child: Row(
          children: [
            SizedBox(
              width: size.width * 45,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                          image: NetworkImage(image),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
