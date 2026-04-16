import 'package:flutter/material.dart'; // For Tab Bar.

void main() {
  runApp(StudentApp());
}

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentHome(),
    );
  }
}

class StudentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Student Portal"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: "Profile"),
              Tab(icon: Icon(Icons.calendar_today), text: "Attendance"),
              Tab(icon: Icon(Icons.bar_chart), text: "Result"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProfileTab(),
            AttendanceTab(),
            ResultTab(),
          ],
        ),
      ),
    );
  }
}

// ---------------- PROFILE ----------------
class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          SizedBox(height: 10),
          Text("Name: HarshSinh Tomar", style: TextStyle(fontSize: 18)),
          Text("Course: BSC-CS"),
          Text("Email: harshrajput5099@gmail.com"),
        ],
      ),
    );
  }
}

// ---------------- ATTENDANCE ----------------
class AttendanceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Attendance: 89.98%",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

// ---------------- RESULT ----------------
class ResultTab extends StatelessWidget {
  final List<Map<String, String>> results = [
    {"subject": "Maths", "marks": "97"},
    {"subject": "Science", "marks": "90"},
    {"subject": "English", "marks": "96"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: results.map((r) {
        return ListTile(
          title: Text(r["subject"]!),
          trailing: Text(r["marks"]!),
        );
      }).toList(),
    );
  }
}
