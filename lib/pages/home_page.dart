import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> matchData = [
    {'teamA': 'Sevilla', 'teamB': 'Valladolid', 'scoreA': 2, 'scoreB': 1},
    {'teamA': 'Valencia', 'teamB': 'Osasuna', 'scoreA': 0, 'scoreB': 0},
    {'teamA': 'Real Madrid', 'teamB': 'Alaves', 'scoreA': 3, 'scoreB': 2},
    {'teamA': 'Atalanta', 'teamB': 'Como', 'scoreA': 2, 'scoreB': 3},
    {'teamA': 'Manchester United', 'teamB': 'Twente', 'scoreA': 1, 'scoreB': 1},
    {'teamA': 'FC barcelona', 'teamB': 'Getafe', 'scoreA': 1, 'scoreB': 0},
    {'teamA': 'Girona', 'teamB': 'Rayo Vallecano', 'scoreA': 0, 'scoreB': 0},
  ];

  final List<Map<String, dynamic>> newsData = [
    {
      'jurnalis': 'Daily Star',
      'headline':
          'Haaland left bleeding after tackle as fans say ankle looks like a dog gnawed on it',
      'dateline': '7 Minutes Ago'
    },
    {
      'jurnalis': 'The Sun',
      'headline':
          'Arsenal Vs Leicester LIVE SCORE: Gunners host Foxes looking to keep up the pressure on league leaders Man City',
      'dateline': '14 Minutes Ago'
    },
    {
      'jurnalis': 'BBC',
      'headline': "Ten Hag hasn't improved any individual at Man Utd",
      'dateline': '21 Minutes Ago'
    },
  ];

  final List<Map<String, dynamic>> favData = [
    {
      'head': 'My Favorite',
      'avatar': [
        'FC Barcelona',
        'Lionel Messi',
      ],
    },
    {
      'head': 'Following Team',
      'avatar': [
        'Fc Barcelona',
        'Spain',
        'Indonesia',
      ],
    },
    {
      'head': 'Following Competitions',
      'avatar': [
        'La Liga',
        'Champions League',
        'Premiere League',
      ],
    },
    {
      'head': 'Following Players',
      'avatar': [
        'Lionel Messi',
        'Lamine Yamal',
        'Frenkie De Jong',
      ],
    },
  ];

  static const styleKu1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 10, 52, 87),
  );

  static const styleKu2 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 84, 15, 27),
  );

  static const styleKu3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 84, 15, 27),
  );

  static const styleKu4 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 84, 15, 27),
  );

  Widget buildScoreCard(String teamA, String teamB, int scoreA, int scoreB) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(teamA, style: styleKu1),
                const Text('vs', style: TextStyle(fontSize: 16)),
                Text(teamB, style: styleKu1),
              ],
            ),
            Text('$scoreA - $scoreB', style: styleKu1),
          ],
        ),
      ),
    );
  }

  Widget buildNewsCard(String jurnalis, String headline, String dateline) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(jurnalis, style: styleKu2),
                const SizedBox(height: 4),
                Text(headline, style: styleKu3),
                const SizedBox(height: 4),
                Text(dateline, style: styleKu2),
                const SizedBox(height: 4),
              ],
            ),
            const Placeholder(
              fallbackHeight: 200,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFavoriteCard(String head, List<String> avatar) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(head, style: styleKu2),
              const SizedBox(height: 4),
              Wrap(
                spacing: 1,
                alignment: WrapAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ...List.generate(
                    avatar.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6),
                      child: Column(
                        children: [
                          const CircleAvatar(),
                          const SizedBox(height: 4),
                          Text(
                            avatar[index],
                            style: styleKu4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }

  // Update the list to include relevant content for each tab
  List<Widget> get widgetOptions {
    return [
      ListView.builder(
        itemCount: matchData.length,
        itemBuilder: (context, index) {
          final match = matchData[index];
          return buildScoreCard(
            match['teamA'],
            match['teamB'],
            match['scoreA'],
            match['scoreB'],
          );
        },
      ),
      ListView.builder(
        itemCount: newsData.length,
        itemBuilder: (context, index) {
          final news = newsData[index];
          return buildNewsCard(
            news['jurnalis'],
            news['headline'],
            news['dateline'],
          );
        },
      ),
      ListView.builder(
        itemCount: favData.length,
        itemBuilder: (context, index) {
          final fav = favData[index];
          final avatars = fav['avatar'] ?? [];
          return buildFavoriteCard(
            fav['head'],
            List<String>.from(avatars),
          );
        },
      ),
      // Profile Tab
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
            ),
            SizedBox(height: 10),
            Text(
              'Your Profile',
              style: styleKu1,
            ),
            SizedBox(height: 10),
            Text(
              'Username: your_username',
              style: styleKu2,
            ),
            Text(
              'Email: your_email@example.com',
              style: styleKu2,
            ),
          ],
        ),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sofa Score'),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.scoreboard_outlined),
            label: 'Score',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
