import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Info'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: Harsh Tomar', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text('Course: BCA', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text('College: XYZ College', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
