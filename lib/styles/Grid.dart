import 'package:flutter/material.dart';
import 'package:my_self/Screen/Materi.dart';

class Gridview extends StatelessWidget {
  List imgData = [
    "assets/images/Quality.png",
    "assets/images/Self.png",
    "assets/images/Skill.png",
    "assets/images/Confident.png",
    "assets/images/Self.png",
    "assets/images/Self.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.1, mainAxisSpacing: 25),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: imgData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MateriScreen(imgData[index]),
                    ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26, spreadRadius: 1, blurRadius: 6)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      imgData[index],
                      width: 120,
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
