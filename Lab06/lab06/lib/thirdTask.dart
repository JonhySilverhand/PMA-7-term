import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPU Usage Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('com.example.cpu_usage/cpu'); // Название канала должно совпадать с нативной частью

  String _cpuUsage = 'Unknown CPU usage';

  Future<void> _getCpuUsage() async {
    String cpuUsage;
    try {
      final double result = await platform.invokeMethod('getCpuUsage'); // Вызываем метод "getCpuUsage"
      cpuUsage = 'CPU Usage: $result%';
    } on PlatformException catch (e) {
      cpuUsage = "Failed to get CPU usage: '${e.message}'.";
    }

    setState(() {
      _cpuUsage = cpuUsage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CPU Usage Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_cpuUsage),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCpuUsage,
              child: Text('Get CPU Usage'),
            ),
          ],
        ),
      ),
    );
  }
}
