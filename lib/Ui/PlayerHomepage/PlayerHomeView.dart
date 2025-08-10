import 'package:flutter/material.dart';

class Playerhomeview extends StatefulWidget {
  Playerhomeview({super.key});

  @override
  State<Playerhomeview> createState() => _PlayerhomeviewState();
}

class _PlayerhomeviewState extends State<Playerhomeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header
            UserAccountsDrawerHeader(
              accountName: Text("Player Name"),
              accountEmail: Text("player@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/player_avatar.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),

            // Menu Items
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text("Workouts"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: Text("Diet Plan"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Welcome to Player Home!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
