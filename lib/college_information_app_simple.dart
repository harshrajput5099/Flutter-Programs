import "package:flutter/material.dart"; // For Navigation Drawer. 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DrawerScreen());
  }
}

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("College Information App")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Menu")),
            ListTile(title: Text("Home")),
            ListTile(title: Text("Courses")),
            ListTile(title: Text("Profile")),
          ],
        ),
      ),
      body: Center(child: Text("Welcome")),
    );
  }
}
