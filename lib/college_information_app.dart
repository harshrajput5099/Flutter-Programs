import 'package:flutter/material.dart';  // For Navigation Drawer.

void main() {
  runApp(CollegeApp());
}

class CollegeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedPage = "Home";

  Widget getPage() {
    switch (selectedPage) {
      case "Courses":
        return CoursesScreen();
      case "Faculty":
        return FacultyScreen();
      case "Student":
        return StudentScreen();
      case "Contact":
        return ContactScreen();
      default:
        return HomePage();
    }
  }

  void selectPage(String page) {
    setState(() {
      selectedPage = page;
    });
    Navigator.pop(context); // Close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPage),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "College App",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () => selectPage("Home"),
            ),
            ListTile(
              title: Text("Courses"),
              onTap: () => selectPage("Courses"),
            ),
            ListTile(
              title: Text("Faculty"),
              onTap: () => selectPage("Faculty"),
            ),
            ListTile(
              title: Text("Student"),
              onTap: () => selectPage("Student"),
            ),
            ListTile(
              title: Text("Contact Us"),
              onTap: () => selectPage("Contact"),
            ),
          ],
        ),
      ),
      body: getPage(),
    );
  }
}

// ---------------- SCREENS ----------------

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Welcome to College App", style: TextStyle(fontSize: 20)),
    );
  }
}

class CoursesScreen extends StatelessWidget {
  final List<String> courses = [
    "BCA",
    "BBA",
    "MCA",
    "MBA",
    "B.Tech"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(courses[index]),
        );
      },
    );
  }
}

class FacultyScreen extends StatelessWidget {
  final List<String> faculty = [
    "Dr. Sharma",
    "Prof. Patel",
    "Dr. Mehta"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: faculty.map((f) => ListTile(title: Text(f))).toList(),
    );
  }
}

class StudentScreen extends StatelessWidget {
  final List<String> students = [
    "Amit",
    "Neha",
    "Raj"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: students.map((s) => ListTile(title: Text(s))).toList(),
    );
  }
}

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Email: college@email.com\nPhone: 1234567890",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
