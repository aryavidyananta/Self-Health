import 'package:flutter/material.dart';
import 'package:my_self/Screen/Login.dart';
import 'package:my_self/component/My_Buttom.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.only(bottom: 20),
                  child: Image.asset("assets/images/Get.png"),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const Text(
                    "Jiwa tenang, Mental Sehat",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const Center(
                    child: Text(
                      "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                      textAlign: TextAlign
                          .center, // Center align the text within the Text widget
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                    customColor:
                        // ignore: prefer_const_constructors
                        Color.fromARGB(255, 13, 143, 134).withOpacity(0.7),
                    text: "Get Started",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              // ignore: prefer_const_constructors
                              builder: (context) => LoginScreen()));
                    })
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Terms of use",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
