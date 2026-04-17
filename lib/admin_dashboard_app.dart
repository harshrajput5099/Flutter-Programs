import 'package:flutter/material.dart';

void main() {
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminHome(),
    );
  }
}

class AdminHome extends StatefulWidget {
  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  String selectedPage = "Dashboard";

  void selectPage(String page) {
    setState(() {
      selectedPage = page;
    });
    Navigator.pop(context);
  }

  Widget getPage() {
    switch (selectedPage) {
      case "Users":
        return Center(child: Text("Users Screen"));
      case "Reports":
        return Center(child: Text("Reports Screen"));
      case "Settings":
        return Center(child: Text("Settings Screen"));
      case "Logout":
        return Center(child: Text("Logged Out"));
      default:
        return dashboard();
    }
  }

  // DASHBOARD WITH SUMMARY CARDS
  Widget dashboard() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          summaryCard("Users", "120", Icons.people, Colors.blue),
          summaryCard("Orders", "75", Icons.shopping_cart, Colors.green),
          summaryCard("Revenue", "₹50K", Icons.monetization_on, Colors.orange),
          summaryCard("Reports", "12", Icons.bar_chart, Colors.red),
        ],
      ),
    );
  }

  Widget summaryCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
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
                  CircleAvatar(child: Icon(Icons.admin_panel_settings)),
                  SizedBox(height: 10),
                  Text(
                    "Admin Panel",
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
              leading: Icon(Icons.people),
              title: Text("Users"),
              onTap: () => selectPage("Users"),
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("Reports"),
              onTap: () => selectPage("Reports"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => selectPage("Settings"),
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