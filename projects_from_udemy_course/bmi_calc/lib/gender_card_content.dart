import 'package:flutter/material.dart';

const double iconSize = 80.0;
const TextStyle labelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xff8d8e98),
);

class GenderCardContent extends StatelessWidget {
  final IconData? genderIcon;
  final String? iconText;

  GenderCardContent({this.genderIcon, this.iconText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: iconSize,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          iconText ?? '',
          style: labelStyle,
        )
      ],
    );
  }
}
