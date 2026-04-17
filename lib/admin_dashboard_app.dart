import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Admin()));
}

class Admin extends StatefulWidget {
  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  String page = "Dashboard";

  void change(String p) {
    setState(() => page = p);
    Navigator.pop(context);
  }

  Widget getBody() {
    if (page == "Users") return Center(child: Text("Users"));
    if (page == "Reports") return Center(child: Text("Reports"));
    if (page == "Settings") return Center(child: Text("Settings"));
    if (page == "Logout") return Center(child: Text("Logged Out"));

    return GridView.count(
      crossAxisCount: 2,
      children: [
        Card(child: Center(child: Text("Users\n120"))),
        Card(child: Center(child: Text("Orders\n75"))),
        Card(child: Center(child: Text("Revenue\n₹50K"))),
        Card(child: Center(child: Text("Reports\n12"))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard"), centerTitle: true),

      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text("Admin Panel")),
            ListTile(title: Text("Dashboard"), onTap: () => change("Dashboard")),
            ListTile(title: Text("Users"), onTap: () => change("Users")),
            ListTile(title: Text("Reports"), onTap: () => change("Reports")),
            ListTile(title: Text("Settings"), onTap: () => change("Settings")),
            ListTile(title: Text("Logout"), onTap: () => change("Logout")),
          ],
        ),
      ),

      body: getBody(),
    );
  }
}