import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const VisitingCardUI(),
    );
  }
}

class VisitingCardUI extends StatelessWidget {
  const VisitingCardUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Photo
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/300',
                  ),
                ),

                const SizedBox(height: 15),

                // Name
                const Text(
                  'Harsh Rajput',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                // Profession
                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),

                const Divider(height: 30, thickness: 1),

                // Contact Details
                Row(
                  children: const [
                    Icon(Icons.phone, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      '+91 9876543210',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: const [
                    Icon(Icons.email, color: Colors.red),
                    SizedBox(width: 10),
                    Text(
                      'harsh@example.com',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      'Ahmedabad, Gujarat',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}