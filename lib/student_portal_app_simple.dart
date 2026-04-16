import 'package:flutter/material.dart'; // For Tab Bar.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                  tabs: [
                    Tab(text: "Profile"),
                    Tab(text: "Attendance"),
                    Tab(text: "Result"),
                  ]
              ),
            ),
            body: TabBarView(
                children: [
                  Center(child: Text("Profile")),
                  Center(child: Text("Attendance")),
                  Center(child: Text("Result")),
                ]
            ),
          )
      ),
    );
  }
}
