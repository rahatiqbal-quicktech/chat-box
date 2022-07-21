import 'package:flutter/material.dart';

class PersonalInformationTextWidget extends StatelessWidget {
  const PersonalInformationTextWidget({
    Key? key,
    required this.fieldName,
    required this.info,
    required this.size,
  }) : super(key: key);

  final Size size;

  final String fieldName;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 25,
            child: Text(
              fieldName,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            width: size.width * 15,
          ),
          SizedBox(
            width: size.width * 50,
            child: Text(
              info,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
