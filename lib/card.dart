import 'package:flutter/material.dart';
import 'constants.dart';

class MyCard extends StatelessWidget {
  final void Function()? onTap;
  final Color backgroundColor;
  final Widget? cardChild;
  MyCard({required this.backgroundColor, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: cardChild,
      ),
    );
  }
}
