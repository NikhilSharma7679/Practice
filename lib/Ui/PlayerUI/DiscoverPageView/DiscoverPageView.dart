import 'package:flutter/material.dart';

class Discoverpageview extends StatefulWidget {
  const Discoverpageview({super.key});

  @override
  State<Discoverpageview> createState() => _DiscoverpageviewState();
}

class _DiscoverpageviewState extends State<Discoverpageview> {
  List<Map<String, String>> exercises = [
    {
      "name": "Push Ups",
      "muscle": "Chest",
      "thumbnail":
      "https://img.icons8.com/external-flat-juicy-fish/344/external-push-up-fitness-flat-flat-juicy-fish.png"
    },
    {
      "name": "Squats",
      "muscle": "Legs",
      "thumbnail":
      "https://img.icons8.com/external-flaticons-lineal-color-flat-icons/344/external-squats-fitness-flaticons-lineal-color-flat-icons.png"
    },
    {
      "name": "Pull Ups",
      "muscle": "Back",
      "thumbnail":
      "https://img.icons8.com/external-flat-juicy-fish/344/external-pull-up-fitness-flat-flat-juicy-fish.png"
    },
    {
      "name": "Lunges",
      "muscle": "Legs",
      "thumbnail":
      "https://img.icons8.com/external-flaticons-lineal-color-flat-icons/344/external-lunges-fitness-flaticons-lineal-color-flat-icons.png"
    },
  ];

  List<String> savedExercises = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Discover Exercises",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.filter_list_outlined))
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search exercises...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Categories Row
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                categoryItem(Icons.fitness_center, "Chest", Colors.red),
                categoryItem(Icons.directions_run, "Legs", Colors.blue),
                categoryItem(Icons.accessibility_new, "Back", Colors.green),
                categoryItem(Icons.favorite, "Cardio", Colors.orange),
                categoryItem(Icons.self_improvement, "Yoga", Colors.purple),
              ],
            ),
          ),

          // Exercise Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                bool isSaved = savedExercises.contains(exercise["name"]);

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Thumbnail
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        child: Image.network(
                          exercise["thumbnail"]!,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(exercise["name"]!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(exercise["muscle"]!,
                            style:
                            const TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            isSaved ? Icons.favorite : Icons.favorite_border,
                            color: isSaved ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isSaved) {
                                savedExercises.remove(exercise["name"]);
                              } else {
                                savedExercises.add(exercise["name"]!);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // Category Item Widget
  Widget categoryItem(IconData icon, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 5),
          Text(title,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
