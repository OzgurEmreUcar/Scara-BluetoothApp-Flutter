
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:scara_app/connection.dart';
import 'package:scara_app/send_message.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scara BT',
      theme: ThemeData(
          colorScheme: ColorScheme.dark(
              secondary: Color(8888), primary: Color(0xFF075E54))),
      home: FutureBuilder(
        future: FlutterBluetoothSerial.instance.requestEnable(),
        builder: (BuildContext context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 200,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          } else {
            return Home();
          }
        },
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Bağlanılabilecek Cihazlar"),
      ),
      body: SelectBondedDevicePage(
        onCahtPage: (device1) {
          BluetoothDevice device = device1;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatPage(
              server: device,
            );
          }));
        },
      ),
    ));
  }
}
