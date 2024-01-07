import 'package:flutter/material.dart';
import 'constants.dart';

const double iconSize = 80.0;

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
          style: kLabelStyle,
        )
      ],
    );
  }
}
