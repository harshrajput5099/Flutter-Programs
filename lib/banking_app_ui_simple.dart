import 'package:flutter/material.dart'; // For Bottom Navigation + Bottom Sheet

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  // Home Page with List
  Widget homePage() {
    return ListView(
      children: [
        ListTile(title: Text("Pizza")),
        ListTile(title: Text("Burger")),
        ListTile(title: Text("Pasta")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pages defined here (clean approach)
    List<Widget> pages = [
      homePage(),
      Center(child: Text("Cart Page")),
      Center(child: Text("Profile Page")),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Food App")),
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) {
            setState(() {
              index = i;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}