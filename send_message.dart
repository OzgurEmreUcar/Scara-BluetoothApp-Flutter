// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

library send_messagee;

import 'dart:async';
import 'dart:convert';

import 'dart:typed_data';
import 'package:holding_gesture/holding_gesture.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice? server;
  const ChatPage({
    Key? key,
    this.server,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  BluetoothConnection? connection;

  final ScrollController listScrollController = ScrollController();

  bool isConnecting = true;

  bool get isConnected => connection != null && connection!.isConnected;

  bool isDisconnecting = false;
  @override
  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server!.address).then((_connection) {
      print('Cihaza bağlanıldı');
      connection = _connection;

      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
    });
  }

  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }
    super.dispose();
  }

  double r1 = 0;

  double r2 = 0;

  bool renk1 = true;
  bool renk2 = true;
  bool renk3 = true;
  bool renk4 = true;

  Widget build(BuildContext context) {
    double ekranGoruntu = -r1 * (360);
    double ekranGoruntu2 = -r2 * (360);

    int deneme1 = ekranGoruntu.toInt();
    int deneme2 = ekranGoruntu2.toInt();

    String ekran = deneme1.toString();
    String ekran2 = deneme2.toString();

    print(deneme1);

    return Scaffold(body: OrientationBuilder(
      builder: (contetx, orientation) {
        return orientation == Orientation.portrait
            ? Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                    child: AspectRatio(
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
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Container(
                                  color: Colors.black,
                                  child: Center(
                                      child: Text(
                                    "CAL",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  height:
                                      MediaQuery.of(context).size.height / 16,
                                  width: MediaQuery.of(context).size.width / 4,
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
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: Colors.black, width: 8)),
                                  child: Center(
                                      child: Text(
                                    "Empty",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  height:
                                      MediaQuery.of(context).size.height / 17,
                                  width: MediaQuery.of(context).size.width / 4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.height / 21,
                                  backgroundColor: Colors.black,
                                  child: Text("+ R1",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.height / 21,
                                    backgroundColor: Colors.black,
                                    child: Text("- R1",
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    "Empty",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  height:
                                      MediaQuery.of(context).size.height / 17,
                                  width: MediaQuery.of(context).size.width / 4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.height / 21,
                                  backgroundColor: Colors.black,
                                  child: Text("+ R1",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.height / 21,
                                    backgroundColor: Colors.black,
                                    child: Text("- R1",
                                        style: TextStyle(color: Colors.white))),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    color: Colors.black,
                                    child: Center(
                                        child: Text(
                                      "Carry",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    height:
                                        MediaQuery.of(context).size.height / 19,
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    color: Colors.black,
                                    child: Center(
                                        child: Text(
                                      "+ P1",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    height:
                                        MediaQuery.of(context).size.height / 19,
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    color: Colors.black,
                                    child: Center(
                                        child: Text(
                                      "+ P2",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    height:
                                        MediaQuery.of(context).size.height / 19,
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/black-wall-texture-19.jpg"),
                        fit: BoxFit.cover)),
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
                                onHold: () => kalibrasyon(),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 1,
                                            blurRadius: 16)
                                      ]),
                                  child: Center(
                                      child: Text(
                                    "CAL",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  height:
                                      MediaQuery.of(context).size.height / 8,
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
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 2.0))
                                    ]),
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
                                onHold: () => donusum_r1Ileri(),
                                onTap: () {
                                  donusum_r1Ileri();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              12)),
                                      boxShadow: [
                                        renk1
                                            ? BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 1,
                                                blurRadius: 8)
                                            : BoxShadow(
                                                color: Colors.green,
                                                spreadRadius: 1,
                                                blurRadius: 8)
                                      ]),
                                  child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.height / 12,
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
                                onHold: () => donusum_r1Geri(),
                                enableHapticFeedback: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              12)),
                                      boxShadow: [
                                        renk2
                                            ? BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 1,
                                                blurRadius: 8)
                                            : BoxShadow(
                                                color: Colors.red,
                                                spreadRadius: 1,
                                                blurRadius: 8)
                                      ]),
                                  child: CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.height /
                                              12,
                                      backgroundColor: Colors.black,
                                      child: Text("- R1",
                                          style:
                                              TextStyle(color: Colors.white))),
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
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 2.0))
                                    ]),
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
                                onHold: () => donusum_r2Ileri(),
                                onTap: () {
                                  donusum_r2Ileri();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              12)),
                                      boxShadow: [
                                        renk3
                                            ? BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 1,
                                                blurRadius: 8)
                                            : BoxShadow(
                                                color: Colors.green,
                                                spreadRadius: 1,
                                                blurRadius: 8)
                                      ]),
                                  child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.height / 12,
                                    backgroundColor: Colors.black,
                                    child: Text("+ R2",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HoldDetector(
                                onHold: () => donusum_r2Geri(),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              12)),
                                      boxShadow: [
                                        renk4
                                            ? BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 1,
                                                blurRadius: 8)
                                            : BoxShadow(
                                                color: Colors.red,
                                                spreadRadius: 1,
                                                blurRadius: 8)
                                      ]),
                                  child: CircleAvatar(
                                    radius:
                                        MediaQuery.of(context).size.height / 12,
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      "- R2",
                                      style: TextStyle(color: Colors.white),
                                    ),
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
                            bottom: 15,
                            left: MediaQuery.of(context).size.width / 4.68,
                            child: AnimatedRotation(
                              turns: r1,
                              duration: Duration(seconds: 1),
                              alignment: Alignment.bottomCenter / 1.5,
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    AnimatedRotation(
                                      turns: r2,
                                      duration: Duration(seconds: 1),
                                      alignment: Alignment.center,
                                      child: Container(
                                          color: Colors.transparent,
                                          height: 50,
                                          width: 50,
                                          child: CustomPaint(
                                            painter: R1Painter(),
                                          )),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                    ),
                                    Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.transparent,
                                        child: CustomPaint(
                                          painter: R2Painter(),
                                        )),
                                  ],
                                ),
                              ),
                            )),
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
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 16)
                                    ]),
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
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 16)
                                    ]),
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
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 16)
                                    ]),
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
      },
    ));
  }

  donusum_r1Ileri() {
    setState(() {
      r1 = r1 - 0.01 / 3.6;

      renk1 = !renk1;

      renk2 = true;
      renk3 = true;
      renk4 = true;
      _sendMessage('1');
    });
  }

  donusum_r2Ileri() {
    setState(() {
      r2 = r2 - 0.01 / 3.6;
      renk3 = !renk3;
      renk2 = true;
      renk1 = true;
      renk4 = true;
      print(r2);
    });
  }

  donusum_r1Geri() {
    setState(() {
      r1 = r1 + 0.01 / 3.6;
      renk2 = !renk2;
      print(r1);
      renk1 = true;
      renk3 = true;
      renk4 = true;
      _sendMessage('0');
    });
  }

  donusum_r2Geri() {
    setState(() {
      r2 = r2 + 0.01 / 3.6;
      renk4 = !renk4;
      renk2 = true;
      renk3 = true;
      renk1 = true;
    });
  }

  kalibrasyon() {
    setState(() {
      r1 = 0;
      r2 = 0;
      renk1 = true;
      renk2 = true;
      renk3 = true;
      renk4 = true;
    });
  }

  _sendMessage(String text) async {
    text = text.trim();

    if (text.length > 0) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text)));
        await connection!.output.allSent;
      } catch (e) {
        // Ignore error, but notify state

      }
    }
  }
}

class R2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromRGBO(119, 0, 0, 1)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    var paint2 = Paint()
      ..color = Color.fromRGBO(119, 0, 0, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRect(
        Rect.fromLTRB(size.width - 40, size.height - 110, size.width - 10,
            size.height - 20),
        Paint());
    canvas.drawRect(
        Rect.fromLTRB(size.width - 40, size.height - 110, size.width - 10,
            size.height - 25),
        paint1);
    canvas.drawCircle(Offset(size.width - 25, size.height - 127), 25, Paint());
    canvas.drawCircle(Offset(size.width - 25, size.height - 25), 25, Paint());
    canvas.drawCircle(Offset(size.width - 25, size.height - 25), 20, paint2);
    canvas.drawCircle(Offset(size.width - 25, size.height - 127), 20, paint2);
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
      ..color = Color.fromRGBO(119, 0, 0, 1)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    var paint2 = Paint()
      ..color = Color.fromRGBO(119, 0, 0, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRect(
        Rect.fromLTRB(size.width - 40, size.height - 110, size.width - 10,
            size.height - 20),
        Paint());
    canvas.drawRect(
        Rect.fromLTRB(size.width - 40, size.height - 110, size.width - 10,
            size.height - 20),
        paint1);

    canvas.drawCircle(Offset(size.width - 25, size.height - 125), 25, Paint());
    canvas.drawCircle(Offset(size.width - 25, size.height - 25), 25, Paint());
    canvas.drawCircle(Offset(size.width - 25, size.height - 125), 20, paint2);
  }

  @override
  bool shouldRepaint(R1Painter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(R1Painter oldDelegate) => false;
}