import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Elearn()));
}

class Elearn extends StatefulWidget {
  @override
  State<Elearn> createState() => _ElearnState();
}

class _ElearnState extends State<Elearn> {
  String page = "Dashboard";

  void change(String p) {
    setState(() => page = p);
    Navigator.pop(context);
  }

  Widget body() {
    if (page == "My Courses") return Center(child: Text("My Courses"));
    if (page == "Profile") return Center(child: Text("Profile"));
    if (page == "Logout") return Center(child: Text("Logged Out"));

    return ListView(
      children: [
        ListTile(title: Text("Flutter")),
        ListTile(title: Text("Python")),
        ListTile(title: Text("UI/UX")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("E-Learning App"), centerTitle: true),

      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text("Menu")),
            ListTile(title: Text("Dashboard"), onTap: () => change("Dashboard")),
            ListTile(title: Text("My Courses"), onTap: () => change("My Courses")),
            ListTile(title: Text("Profile"), onTap: () => change("Profile")),
            ListTile(title: Text("Logout"), onTap: () => change("Logout")),
          ],
        ),
      ),

      body: body(),
    );
  }
}