import 'package:flutter/material.dart';

void main() {
  runApp(ElearningApp());
}

class ElearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedPage = "Dashboard";

  void selectPage(String page) {
    setState(() {
      selectedPage = page;
    });
    Navigator.pop(context); // close drawer
  }

  Widget getPage() {
    switch (selectedPage) {
      case "My Courses":
        return MyCoursesPage();
      case "Profile":
        return ProfilePage();
      case "Logout":
        return LogoutPage();
      default:
        return DashboardPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Learning App"),
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  SizedBox(height: 10),
                  Text(
                    "Student Portal",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: () => selectPage("Dashboard"),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("My Courses"),
              onTap: () => selectPage("My Courses"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => selectPage("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () => selectPage("Logout"),
            ),
          ],
        ),
      ),

      body: getPage(),
    );
  }
}

// ---------------- DASHBOARD ----------------
class DashboardPage extends StatelessWidget {
  final List<String> courses = [
    "Flutter Development",
    "Python Basics",
    "UI/UX Design",
    "Data Structures"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: courses
          .map((c) => ListTile(
        leading: Icon(Icons.play_circle_fill),
        title: Text(c),
      ))
          .toList(),
    );
  }
}

// ---------------- MY COURSES ----------------
class MyCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "My Enrolled Courses",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

// ---------------- PROFILE ----------------
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          SizedBox(height: 10),
          Text("Name: HarshSinh Tomar"),
          Text("Course: Computer Science"),
          Text("Email: harshrajput5099@email.com"),
        ],
      ),
    );
  }
}

// ---------------- LOGOUT ----------------
class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "You have been logged out",
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
    );
  }
}