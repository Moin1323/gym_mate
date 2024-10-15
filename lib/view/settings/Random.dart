import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SwitchScreen(),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  @override
  _SwitchScreenState createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Switch Example'),
      ),
      child: Center(
        child: CupertinoSwitch(
          value: _isSwitchOn,
          onChanged: (bool value) {
            setState(() {
              _isSwitchOn = value;
            });
          },
        ),
      ),
    );
  }
}
