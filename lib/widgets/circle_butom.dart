import 'package:flutter/material.dart';
import 'package:my_self/constants/Colors2.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onPressed;
  // ignore: use_super_parameters
  const CircleButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryLight,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
