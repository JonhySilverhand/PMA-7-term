import 'package:flutter/material.dart';
import 'secondPage.dart'; // Импортируем страницу, куда нужно сделать переход

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RamadanScreen(),
    );
  }
}

class RamadanScreen extends StatelessWidget {
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
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Wednesday, 28 March', style: TextStyle(fontSize: 18)),
                        Text('13 Sha\'ban, 1442 AH', style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 138, 119, 232))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            leading: Container(
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
                  _buildPrayerTimeCard(0, 'Sehri Time', '', '3:40 am', Icons.nightlight_round, Color.fromARGB(255, 131, 107, 254), Color.fromARGB(255, 227, 221, 255)),
                  _buildPrayerTimeCard(1, 'Remaining', 'Dhuhur', '15:20 min', Icons.wb_sunny, Colors.deepOrange, Color.fromARGB(255, 54, 34, 159)),
                  _buildPrayerTimeCard(2, 'Next Prayer', 'Asr', '14:24 pm', Icons.cloud, Colors.white, Color.fromARGB(255, 130, 106, 255)),
                  _buildPrayerTimeCard(3, 'Iftar Time', '', '6:45 pm', Icons.sunny, Colors.amber, Color.fromARGB(255, 255, 234, 191)),
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
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
          selectedItemColor: Color.fromARGB(255, 99, 74, 226),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildPrayerTimeCard(int index, String title, String text, String time, IconData icon, Color color, Color backcolor) {
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
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 112, 94, 205)),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 237, 179, 119)),
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
            Text('Daily Dua', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Our Lord! Accept (this service) from us: For Thou art the All-Hearing, the All-Knowing.',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 5),
            Text('Surah Al-Baqarah - 2:127', style: TextStyle(color: Colors.deepPurple)),
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
