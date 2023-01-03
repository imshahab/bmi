import 'package:flutter/material.dart';
import 'constants.dart';

class MyRoundButton extends StatelessWidget {
  final IconData? icon;
  final void Function()? onTap;

  MyRoundButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF424252),
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(width: 48.0, height: 48.0),
      child: Icon(icon),
    );
  }
}
