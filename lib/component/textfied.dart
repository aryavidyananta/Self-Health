import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final void Function()? onPressed;
  final bool obscureText;
  final TextEditingController? controller;

  // ignore: use_super_parameters
  const MyTextField({
    Key? key,
    required this.hintText,
    this.icon,
    this.onPressed,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 164, 166, 166).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                ),
              ),
              obscureText: obscureText,
            ),
          ),
          if (icon != null)
            IconButton(
              onPressed: onPressed,
              icon: Icon(icon),
              color: const Color.fromARGB(255, 13, 143, 134),
            ),
        ],
      ),
    );
  }
}
