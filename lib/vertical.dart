
import 'package:flutter/material.dart';

import 'package:holding_gesture/holding_gesture.dart';


class VerticalScreen extends StatefulWidget {
  const VerticalScreen({ Key? key, required this.r2Geri, required this.r1Geri, required this.kalibrasyon_2 , required this.r1Ileri, required this.r2Ileri}) : super(key: key);
final Function r1Geri;
final Function r2Geri;
final Function r1Ileri;
final Function r2Ileri;
final Function kalibrasyon_2;
  @override
  _VerticalScreenState createState() => _VerticalScreenState();
}


  double r1 = 0;

  double r2 = 0;
class _VerticalScreenState extends State<VerticalScreen> {
  @override
  Widget build(BuildContext context) {
    double ekranGoruntu = -r1 * (360);
    double ekranGoruntu2 = -r2 * (360);
    
   int deneme1 = ekranGoruntu.toInt();
    int deneme2 = ekranGoruntu2.toInt();

    String ekran = deneme1.toString();
    String ekran2 = deneme2.toString();
    return  Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/black-wall-texture-19.jpg"),
                fit: BoxFit.cover)
              ),
              
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: HoldDetector(
                                onHold: () => widget.kalibrasyon_2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      boxShadow:[
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 16

                                        )
                                      ]

                                  ),
                                
                                  child: Center(
                                      child: Text(
                                    "CAL",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  height: MediaQuery.of(context).size.height / 8,
                                  width: MediaQuery.of(context).size.width / 8,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                               
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                    
                                     
                                       boxShadow:[
                                        BoxShadow(
                                          color: Colors.grey,
                                         
                                          
                                          offset : Offset(0.0,2.0)

                                        )
                                      ]

                                      

                                  ),
                                child: Center(
                                    child: Text(
                                  ekran,
                                  style: TextStyle(color: Colors.white),
                                )),
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 8,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HoldDetector(
                                onHold: () => widget.r1Ileri,
                                onTap: () =>
                                  widget.r1Ileri
                                ,
                                child: Container(
                                  decoration: BoxDecoration(
                                     color: Colors.black,
                                      borderRadius: BorderRadius.all(Radius.circular( MediaQuery.of(context).size.height / 12)),
                                      boxShadow:[
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 8

                                        )
                                      ]
                                  ),
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.height / 12,
                                    backgroundColor: Colors.black,
                                    child: Text("+ R1",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HoldDetector(
                                onHold: () => widget.r1Geri,
                                child: Container(
                                  decoration: BoxDecoration(
                                     color: Colors.black,
                                      borderRadius: BorderRadius.all(Radius.circular( MediaQuery.of(context).size.height / 12)),
                                      boxShadow:[
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 8

                                        )
                                      ]
                                  ),
                                  child: CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.height / 12,
                                      backgroundColor: Colors.black,
                                      child: Text("- R1",
                                          style: TextStyle(color: Colors.white))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.black, width: 8)),
                                child: Center(
                                    child: Text(
                                  ekran2,
                                  style: TextStyle(color: Colors.white),
                                )),
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 8,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HoldDetector(
                                onHold: () => widget.r2Ileri,
                                onTap: () =>
                                  widget.r2Ileri,
                                
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.height / 12,
                                  backgroundColor: Colors.black,
                                  child: Text("+ R2",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HoldDetector(
                                onHold: () => widget.r2Geri,
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.height / 12,
                                  backgroundColor: Colors.black,
                                  child: Text(
                                    "- R2",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 0.9,
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 10),
                              itemCount: 10 * 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                );
                              }),
                        ),
                        Positioned(
                          bottom: 35,
                          left: MediaQuery.of(context).size.width / 7.5,
                          child: AnimatedRotation(
                            alignment: Alignment.bottomCenter,
                            turns: r1,
                            duration: Duration(seconds: 1),
                            child: Column(
                              children: [
                                AnimatedRotation(
                                    turns: r2,
                                    alignment: Alignment.bottomCenter,
                                    duration: Duration(seconds: 1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Column(
                                        children: [
                                          CustomPaint(painter: R2Painter(),
                                          )
                                        ],
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    color: Colors.transparent,
                                    height: 150,
                                    width: 150,
                                    child: CustomPaint(
                                      painter: R1Painter(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                color: Colors.black,
                                child: Center(
                                    child: Text(
                                  "Carry",
                                  style: TextStyle(color: Colors.white),
                                )),
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 8,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                color: Colors.black,
                                child: Center(
                                    child: Text(
                                  "+ P1",
                                  style: TextStyle(color: Colors.white),
                                )),
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 8,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                color: Colors.black,
                                child: Center(
                                    child: Text(
                                  "+ P2",
                                  style: TextStyle(color: Colors.white),
                                )),
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
            );
  }
}

class R2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTRB(size.width - 15, size.height - 85, size.width + 15,
            size.height + 20),
        paint1);
    canvas.drawCircle(Offset(size.width, size.height - 100), 25, Paint());
    canvas.drawCircle(Offset(size.width, size.height), 25, Paint());
  }

  @override
  bool shouldRepaint(R2Painter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(R2Painter oldDelegate) => false;
}

class R1Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTRB(
            size.width - 90, size.height - 140, size.width - 60, size.height),
        paint1);

    canvas.drawCircle(Offset(size.width - 75, size.height), 25, Paint());
    canvas.drawCircle(Offset(size.width - 75, size.height - 150), 25, Paint());
  }

  @override
  bool shouldRepaint(R1Painter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(R1Painter oldDelegate) => false;
}
