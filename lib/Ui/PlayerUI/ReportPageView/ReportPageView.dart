import 'package:flutter/material.dart';

class Reportpageview extends StatefulWidget {
  const Reportpageview({super.key});

  @override
  State<Reportpageview> createState() => _ReportpageviewState();
}

class _ReportpageviewState extends State<Reportpageview> {
  // Example player data
  final List<Map<String, dynamic>> players = [
    {"name": "John Smith", "score": 98, "image": "https://i.pravatar.cc/150?img=1"},
    {"name": "Alex Johnson", "score": 95, "image": "https://i.pravatar.cc/150?img=2"},
    {"name": "Chris Lee", "score": 92, "image": "https://i.pravatar.cc/150?img=3"},
    {"name": "David Kim", "score": 88, "image": "https://i.pravatar.cc/150?img=4"},
    {"name": "Emma Wilson", "score": 85, "image": "https://i.pravatar.cc/150?img=5"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports Leaderboard"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          final rank = index + 1;

          // Colors for top 3
          Color? tileColor;
          if (rank == 1) tileColor = Colors.amber[300];
          else if (rank == 2) tileColor = Colors.grey[300];
          else if (rank == 3) tileColor = Colors.brown[300];

          return Card(
            color: tileColor,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(player["image"]),
                radius: 25,
              ),
              title: Text(
                "${rank}. ${player["name"]}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "${player["score"]} pts",
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
          );
        },
      ),
    );
  }
}
