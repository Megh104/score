import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('UCSC 2022'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Add calendar functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Carousel
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  buildEventCard(
                    imagePath: 'assets/images/FOOTBALL.jpeg',
                    title: 'Football Game',
                    date: 'Sat, Jan 5, 11:00 AM - 1:00 PM',
                  ),
                  buildEventCard(
                    imagePath: 'assets/images/CRICKET.jpeg',
                    title: 'Soccer Game',
                    date: 'Sun, Jan 6, 11:00 AM',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'My Schedule',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Schedule List
            Expanded(
              child: ListView(
                children: [
                  buildScheduleCard(
                    imagePath: 'assets/images/FOOTBALL.jpeg',
                    title: 'Football Game',
                    date: 'Sat, Jan 5, 11:00 AM - 1:00 PM',
                    location: 'Stadium',
                  ),
                  buildScheduleCard(
                    imagePath: 'assets/images/CRICKET.jpeg',
                    title: 'Cricket Game',
                    date: 'Sun, Jan 6, 11:00 AM - 1:00 PM',
                    location: 'Stadium',
                  ),
                  buildScheduleCard(
                    imagePath: 'assets/images/TENNIS.jpeg',
                    title: 'Tennis Game',
                    date: 'Mon, Jan 7, 11:00 AM - 1:00 PM',
                    location: 'Stadium',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchedulePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }

  // Event Card Builder
  Widget buildEventCard({
    required String imagePath,
    required String title,
    required String date,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Schedule Card Builder
  Widget buildScheduleCard({
    required String imagePath,
    required String title,
    required String date,
    required String location,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            Text(location),
          ],
        ),
        onTap: () {
          // Handle card tap
        },
      ),
    );
  }
}

// Schedule Page
class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: Center(
        child: Text(
          'This is the Schedule Page.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text(
          'This is the Profile Page.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
