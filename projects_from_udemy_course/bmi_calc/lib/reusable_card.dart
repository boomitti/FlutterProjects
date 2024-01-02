import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? cardColor;
  final Widget? cardContent;
  final Function() onPress;

  ReusableCard(
      {@required this.cardColor, this.cardContent, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: cardContent,
        ),
      ),
    );
  }
}
