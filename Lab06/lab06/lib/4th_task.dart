import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class BatteryInfo {
  static const MethodChannel _batteryChannel =
  MethodChannel('com.example.cpu_usage/cpu');

  static Future<int> getBatteryLevel() async {
    final int batteryLevel = await _batteryChannel.invokeMethod('getBatteryLevel');
    return batteryLevel;
  }
}

class BatteryInfoScreen extends StatefulWidget {
  const BatteryInfoScreen({super.key});

  @override
  BatteryInfoScreenState createState() => BatteryInfoScreenState();
}

class BatteryInfoScreenState extends State<BatteryInfoScreen> {
  static const platform = MethodChannel('com.example.cpu_usage/cpu');
  int _batteryLevel = 0;

  Future<void> _getBatteryLevel() async {
    final int batteryLevel = await BatteryInfo.getBatteryLevel();
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Info'),
      ),
      body: Center(
        child: Text(
            'Battery level: $_batteryLevel%'),
      ),
    );
  }
}