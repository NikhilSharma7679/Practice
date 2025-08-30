import 'package:flutter/material.dart';
import '../TrainingPageview/TraingPageview.dart';
import '../DiscoverPageView/DiscoverPageView.dart';
import '../ReportPageView/ReportPageView.dart';

class Settingspageview extends StatefulWidget {
  const Settingspageview({super.key});

  @override
  State<Settingspageview> createState() => _SettingspageviewState();
}

class _SettingspageviewState extends State<Settingspageview> {
  bool syncToHealthConnect = false;
  int _selectedIndex = 3; // Settings tab active

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          // MaterialPageRoute(builder: (context) => TrainingPageView()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Discoverpageview()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Reportpageview()),
        );
        break;
      case 3:
      // Already in Settings
        break;
    }
  }

  Widget settingsTile(IconData icon, Color color, String title, {String? subtitle, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)) : null,
      onTap: onTap,
      trailing: const Icon(Icons.chevron_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SETTINGS", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Backup & Restore
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Backup & Restore", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 4),
                    Text("Sign in and synchronize your data", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.g_mobiledata, size: 32, color: Colors.red),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.sync, color: Colors.blueAccent),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Go Premium Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {},
              child: const Text("GO PREMIUM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),

          const SizedBox(height: 8),

          // Settings List
          settingsTile(Icons.water_drop, Colors.green, "Workout Settings"),
          settingsTile(Icons.settings, Colors.blue, "General Settings"),
          settingsTile(Icons.mic, Colors.orange, "Voice Options (TTS)"),
          settingsTile(Icons.chat_bubble, Colors.teal, "Suggest Other Features"),
          settingsTile(Icons.language, Colors.purple, "Language Options", subtitle: "Default"),

          // Sync toggle
          SwitchListTile(
            secondary: const Icon(Icons.health_and_safety, color: Colors.blue),
            title: const Text("Sync to Health Connect"),
            value: syncToHealthConnect,
            onChanged: (value) {
              setState(() {
                syncToHealthConnect = value;
              });
            },
          ),

          const Divider(height: 1),

          // Share and Rate
          settingsTile(Icons.share, Colors.grey.shade700, "Share with friends"),
          settingsTile(Icons.star, Colors.grey.shade700, "Rate us"),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Training'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
