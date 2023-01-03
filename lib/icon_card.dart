import 'package:flutter/material.dart';
import 'constants.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  final String text;

  IconCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(text, textAlign: TextAlign.center, style: kLabelTextStyle)
      ],
    );
  }
}
