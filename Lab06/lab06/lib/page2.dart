import 'package:flutter/material.dart';

void main() {
  runApp(SecondPage());
}

class SecondPage extends StatelessWidget {
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
                    onPressed: () {},
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
                      Text('Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

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
        bottomNavigationBar: SizedBox(
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
      ),
    );
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