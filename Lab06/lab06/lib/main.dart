import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab06/alarm_screen.dart';

import '4th_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Page1(),
    Page2(data: 'Hello from FirstScreen!'),
    Page3(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 241, 239, 252),
            elevation: 0,
            title: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page2(data: 'Hello from FirstScreen!')),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Wednesday, 28 March', style: TextStyle(
                            fontSize: 18)),
                        Text('13 Sha\'ban, 1442 AH', style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 138, 119, 232))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AlarmPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white),
                ),
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 22, height: 3, color: Color.fromARGB(255, 113, 93, 212)),
                        SizedBox(height: 4),
                        Container(width: 12, height: 3, color: Color.fromARGB(255, 181, 179, 193)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 241, 239, 252),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Prayer Times Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildPrayerTimeCard(
                      0,
                      'Sehri Time',
                      '',
                      '3:40 am',
                      Icons.nightlight_round,
                      Color.fromARGB(255, 131, 107, 254),
                      Color.fromARGB(255, 227, 221, 255)),
                  _buildPrayerTimeCard(
                      1,
                      'Remaining',
                      'Dhuhur',
                      '15:20 min',
                      Icons.wb_sunny,
                      Colors.deepOrange,
                      Color.fromARGB(255, 54, 34, 159)),
                  _buildPrayerTimeCard(
                      2,
                      'Next Prayer',
                      'Asr',
                      '14:24 pm',
                      Icons.cloud,
                      Colors.white,
                      Color.fromARGB(255, 130, 106, 255)),
                  _buildPrayerTimeCard(
                      3,
                      'Iftar Time',
                      '',
                      '6:45 pm',
                      Icons.sunny,
                      Colors.amber,
                      Color.fromARGB(255, 255, 234, 191)),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Daily Dua
            _buildDuaCard(),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Categories
            _buildCategories(),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimeCard(int index, String title, String text, String time,
      IconData icon, Color color, Color backcolor) {
    if (index == 0 || index == 3) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        color: backcolor,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 112, 94, 205)),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(icon, color: color, size: 60),
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        color: backcolor,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white),
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 237, 179, 119)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(icon, color: color, size: 50),
                  ),
                  Text(
                    time,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildDuaCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily Dua',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Our Lord! Accept (this service) from us: For Thou art the All-Hearing, the All-Knowing.',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 5),
            Text('Surah Al-Baqarah - 2:127',
                style: TextStyle(color: Colors.deepPurple)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCategoryCard('Prayer Time', Icons.access_time),
          SizedBox(width: 20),
          _buildCategoryCard('Mosque Finder', Icons.location_on),
          _buildCategoryCard('Al-Quran', Icons.book),
          _buildCategoryCard('Al-Quran', Icons.book),
          _buildCategoryCard('Al-Quran', Icons.book),
          _buildCategoryCard('Al-Quran', Icons.book),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.deepPurple, size: 30),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}



class Page2 extends StatelessWidget {
  final String data;

  Page2({required this.data});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fasting Schedule',
      theme: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Color.fromARGB(255, 99, 73, 235),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 99, 73, 235),
          elevation: 0,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.notifications, color: Colors.black),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const BatteryInfoScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          '28 March, 2021',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    // Дни недели
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDayCard('Mo', '22'),
                          _buildDayCard('Tu', '23'),
                          _buildDayCard('We', '24'),
                          _buildDayCard('Th', '25'),
                          _buildDayCard('Fr', '26'),
                          _buildDayCard('Sa', '27'),
                          _buildDayCard('Su', '28'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
              // Белый контейнер
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 30.0, right: 30.0),
                        width: 330,
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Are you have a \nfasting today?', style: TextStyle(fontSize: 20)),
                            Icon(Icons.check_circle, color: Colors.green),
                          ],
                        ),
                      ),

                      SizedBox(height: 16),
                      Text(data, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                      Row(
                        children: [
                          SizedBox(width: 10),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                _buildScheduleCard('Suhoor', '02:00 AM - 04:36 AM', Icons.nightlight_round),
                                _buildScheduleCard('Dhuhr', '12:07 PM - 04:29 PM', Icons.wb_sunny),
                                _buildScheduleCard('Asr', '04:30 PM - 06:12 PM', Icons.cloud),
                                _buildScheduleCard('Iftar', '06:16 PM - 07:28 PM', Icons.sunny),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildScheduleCard(String title, String time, IconData icon) {

  return Container(
    width: 300,
    height: 103,
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      color: Color.fromARGB(255, 253, 253, 255),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 26.0),
                  child: Column(
                    children: [
                      SizedBox(height: 13),
                      Icon(Icons.circle_outlined, size: 25, color: Color.fromARGB(255, 253, 185, 29)),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Row(

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromARGB(255, 239, 236, 252),
                              ),
                              child: Icon(icon, color: Colors.purple, size: 40),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title, style: TextStyle(fontSize: 16)),
                                SizedBox(height: 4),
                                Text(time, style: TextStyle(fontSize: 14, color: Colors.grey)), // Текст времени
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}


Widget _buildDayCard(String day, String date) {
  return Container(
    width: 35,
    height: 55,
    decoration: BoxDecoration(
      color: date == '28' ? Color.fromARGB(255, 81, 53, 225) : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(day, style: TextStyle(color: Colors.white, fontSize: 13)),
        SizedBox(height: 4),
        Text(date, style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    ),
  );
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  static const platform = MethodChannel('com.example.cpu_usage/cpu');

  String _cpuUsage = 'Unknown CPU usage';

  Future<void> _getCpuUsage() async {
    String cpuUsage;
    try {
      final double result = await platform.invokeMethod('getCpuUsage');
      cpuUsage = 'CPU Usage: ${result.toStringAsFixed(5)}%';
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
        title: Text('Page 3 - CPU Usage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _cpuUsage,
              style: TextStyle(fontSize: 24),
            ),
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




