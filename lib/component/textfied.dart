import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final void Function()? onPressed;
  final bool obsecureText;

  const MyTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.onPressed,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(horizontal: 25),
      // ignore: prefer_const_constructors
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          color: Color.fromARGB(255, 0, 110, 255)!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                    // ignore: prefer_const_constructors
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5))),
            obscureText: obsecureText,
          )),
          IconButton(onPressed: onPressed, icon: Icon(icon)),
        ],
      ),
    );
  }
}
