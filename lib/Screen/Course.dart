import 'package:flutter/material.dart';
import 'package:my_self/component/size_config.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 7),
            child: Column(
              children: const [ButtonBar(), Frame10280Widget()],
            ),
          )
        ],
      ),
    );
  }
}

class Frame10280Widget extends StatelessWidget {
  const Frame10280Widget({super.key});
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Frame10280Widget - FRAME
    return Container(
        width: 326,
        height: 671,
        decoration: BoxDecoration(),
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Container(
                        width: 326,
                        height: 217.9999542236328,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 326,
                                  height: 217.9999542236328,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 326,
                                            height: 217.9999542236328,
                                            child: Stack(children: <Widget>[
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                      width: 326,
                                                      height: 217.9999542236328,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                      ))),
                                              Positioned(
                                                child: Image.asset(
                                                  'assets/images/Image2.png',
                                                  width: 400,
                                                  height: 200,
                                                ),
                                              ),
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: //Mask holder Template
                                                      Container(
                                                          width: 326,
                                                          height:
                                                              217.9999542236328,
                                                          child: null)),
                                              Positioned(
                                                  top: 160.99996948242188,
                                                  left: -2.842170943040401e-14,
                                                  child: Container(
                                                      width: 326,
                                                      height:
                                                          56.481807708740234,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        color: Color.fromRGBO(
                                                            65, 94, 146, 1),
                                                      ))),
                                            ]))),
                                  ]))),
                          Positioned(
                              top: 172,
                              left: 5,
                              child: Text(
                                'Mood Cepat Berubah Apakah Bipolar ?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 11,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 169,
                              left: 269,
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  50, 73, 115, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(40, 40)),
                                            ))),
                                  ]))),
                          Positioned(
                              top: 191,
                              left: 14,
                              child: Text(
                                '30 Menit',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 10,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                        ])),
                    SizedBox(height: 16),
                    Container(
                        width: 326,
                        height: 218.48178100585938,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 326,
                                  height: 218.48178100585938,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 326,
                                            height: 217.99993896484375,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ))),
                                    Positioned(
                                      child: Image.asset(
                                        'assets/images/Image2.png',
                                        width: 400,
                                        height: 200,
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: //Mask holder Template
                                            Container(
                                                width: 326,
                                                height: 217.99993896484375,
                                                child: null)),
                                    Positioned(
                                        top: 161.99996948242188,
                                        left: 0,
                                        child: Container(
                                            width: 326,
                                            height: 56.481807708740234,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                              color: Color.fromRGBO(
                                                  65, 94, 146, 1),
                                            ))),
                                  ]))),
                          Positioned(
                              top: 172,
                              left: 14,
                              child: Text(
                                'Cara Berdamai Dengan Masa Lalu',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 11,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 191,
                              left: 14,
                              child: Text(
                                '30 Menit',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 10,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 169.99993896484375,
                              left: 270,
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 40,
                                            height: 40,
                                            child: Stack(children: <Widget>[
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            50, 73, 115, 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius
                                                                    .elliptical(
                                                                        40,
                                                                        40)),
                                                      ))),
                                            ]))),
                                  ]))),
                        ])),
                    SizedBox(height: 16),
                    Container(
                        width: 326,
                        height: 220.48178100585938,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 326,
                                  height: 220.48178100585938,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 326,
                                            height: 217.99993896484375,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                              color: Color.fromRGBO(
                                                  250, 250, 250, 1),
                                            ))),
                                    Positioned(
                                      child: Image.asset(
                                        'assets/images/Image2.png',
                                        width: 400,
                                        height: 200,
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: //Mask holder Template
                                            Container(
                                                width: 326,
                                                height: 217.99993896484375,
                                                child: null)),
                                    Positioned(
                                        top: 163.99996948242188,
                                        left: 0,
                                        child: Container(
                                            width: 326,
                                            height: 56.481807708740234,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                              color: Color.fromRGBO(
                                                  65, 94, 146, 1),
                                            ))),
                                  ]))),
                          Positioned(
                              top: 172.51806640625,
                              left: 268,
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  50, 73, 115, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(40, 40)),
                                            ))),
                                  ]))),
                          Positioned(
                              top: 172,
                              left: 12,
                              child: Text(
                                'Toxic vs Healthy Relationship',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 11,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 191,
                              left: 12,
                              child: Container(
                                  width: 42,
                                  height: 13,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Text(
                                          '30 Menit',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 10,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                  ]))),
                        ])),
                  ]))),
        ]));
  }
}
