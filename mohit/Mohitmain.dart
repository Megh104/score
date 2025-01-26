import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1A1A2E),
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    PlayersPage(),
    GamesPage(),
    SettingsPage(),
  ];

  final List<String> _titles = [
    "Home",
    "Players",
    "Games",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF111122),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Home',
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Players',
              child: Icon(Icons.person),
            ),
            label: 'Players',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Games',
              child: Icon(Icons.sports_basketball),
            ),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Settings',
              child: Icon(Icons.settings),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Home Page!',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

// Players Page
class PlayersPage extends StatelessWidget {
  final List<Map<String, String>> players = [
    {'name': 'LeBron James', 'team': 'LAL - SF', 'image': ''},
    {'name': 'Giannis Antetokounmpo', 'team': 'MIL - PF', 'image': ''},
    {'name': 'Kevin Durant', 'team': 'BKN - SF', 'image': ''},
    {'name': 'Stephen Curry', 'team': 'GSW - PG', 'image': ''},
    {'name': 'Nikola Jokić', 'team': 'DEN - C', 'image': ''},
    {'name': 'Joel Embiid', 'team': 'PHI - C', 'image': ''},
    {'name': 'Luka Dončić', 'team': 'DAL - PG', 'image': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[800], // Placeholder background
            child: Icon(
              Icons.person,
              color: Colors.white,
            ), // Placeholder icon
            radius: 24,
          ),
          title: Text(
            player['name']!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            player['team']!,
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
        );
      },
    );
  }
}

// Games Page
class GamesPage extends StatelessWidget {
  final List<Map<String, String>> sports = [
    {
      'name': 'Football',
      'image': 'assets/images/FOOTBALL.jpeg',
    },
    {
      'name': 'Tennis',
      'image': 'assets/images/TENNIS.jpeg',
    },
    {
      'name': 'Cricket',
      'image': 'assets/images/CRICKET.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: sports.length,
        itemBuilder: (context, index) {
          final sport = sports[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScoreboardPage(sportName: sport['name']!),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      sport['image']!,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        sport['name']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Scoreboard Page
class ScoreboardPage extends StatelessWidget {
  final String sportName;

  ScoreboardPage({required this.sportName});

  @override
  Widget build(BuildContext context) {
    // Sample data for different sports
    Map<String, String> liveScores = {
      'Football': 'Team A 2 - 1 Team B',
      'Tennis': 'Player 1 6 - 3 Player 2',
      'Cricket': 'Team A 150/4 in 20 overs',
    };

    Map<String, String> recentMatches = {
      'Football': 'Last Match: Team C 1 - 0 Team D',
      'Tennis': 'Last Match: Player 3 def. Player 4 6 - 4',
      'Cricket': 'Last Match: Team B won by 5 wickets',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('$sportName Scoreboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'Live Score: ${liveScores[sportName]}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Recent Match:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                recentMatches[sportName]!,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Settings Page
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Page Content Here',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
