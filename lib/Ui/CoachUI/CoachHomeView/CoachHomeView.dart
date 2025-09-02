import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../PlayerUI/DiscoverPageView/DiscoverPageView.dart';
import '../../PlayerUI/ReportPageView/ReportPageView.dart';
import '../../PlayerUI/SettingsPageView/SettingsPageView.dart';
import 'CoachHomeViewModel.dart';

class CoachHomeView extends StatefulWidget {
  const CoachHomeView({super.key});

  @override
  State<CoachHomeView> createState() => _CoachHomeViewState();
}

class _CoachHomeViewState extends State<CoachHomeView> {
  int _selectedIndex = 0;


  // Pages for each tab
  final List<Widget> _pages = const [
    CoachHomePage(),
    Reportpageview(),
    Discoverpageview(),
    Settingspageview(),
  ];

  // Handle tab change
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CoachHomeViewModel>.reactive(
        viewModelBuilder: () => CoachHomeViewModel(),
   builder: (context, viewModel, child) {
     return Scaffold(
       backgroundColor: Colors.grey[100],
       body: _pages[_selectedIndex], // Show page based on selected tab
       bottomNavigationBar: BottomNavigationBar(
         currentIndex: _selectedIndex,
         onTap: _onItemTapped,
         type: BottomNavigationBarType.fixed,
         selectedItemColor: Colors.blue,
         unselectedItemColor: Colors.grey,
         showUnselectedLabels: true,
         items: const [
           BottomNavigationBarItem(
             icon: Icon(Icons.home),
             label: "Home",
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.bar_chart),
             label: "Report",
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.search),
             label: "Discover",
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.settings),
             label: "Settings",
           ),
         ],
       ),
     );
   },);

  }
}

// ==== Dummy Pages for Navigation ====
class CoachHomePage extends StatelessWidget {
  const CoachHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "HOME WORKOUT",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.local_fire_department, color: Colors.red, size: 28),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: const [
                              Icon(Icons.local_fire_department_rounded, color: Colors.brown, size: 18),
                              SizedBox(width: 4),
                              Text(
                                "PRO",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                /// Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search workouts, plans...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /// Weekly Goal
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Weekly goal",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "0/7",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                /// Dates Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    int date = 10 + index;
                    bool isSelected = date == 12;
                    return  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: isSelected
                          ? BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 2),
                      )
                          : null,
                      child: Text(
                        "$date",
                        style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.black,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 12),

                /// Welcome Card
                 Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage("assets/trainer.jpg"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Welcome back! Today’s your chance to shine.",
                          style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                /// Challenge Title
                const Text(
                  "Challenge",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                /// Challenge Card
                 AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage("assets/fullbody.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue.withOpacity(0.7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "28 DAYS",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "FULL BODY CHALLENGE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: Text(
                              "Start your body-toning journey to target all muscle groups and build your dream body in 4 weeks!",
                              style: const TextStyle(color: Colors.white, fontSize: 13),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "START",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /// Body Focus
                const Text(
                  "Body Focus",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                /// Horizontal List
                 SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // _buildBodyFocusButton("Abs"),
                      // _buildBodyFocusButton("Arm"),
                      // _buildBodyFocusButton("Chest"),
                      // _buildBodyFocusButton("Leg"),
                      // _buildBodyFocusButton("Shoulder"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("📊 This is Report Page", style: TextStyle(fontSize: 22)),
    );
  }
}

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("🔍 This is Discover Page", style: TextStyle(fontSize: 22)),
    );
  }
}


//
// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text("⚙️ This is Settings Page", style: TextStyle(fontSize: 22)),
//     );
//   }
// }
