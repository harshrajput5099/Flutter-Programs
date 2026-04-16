import "package:flutter/material.dart"; // For Bottom Sheet and ListView

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MenuScreen());
  }
}

class MenuScreen extends StatelessWidget {
  final List<String> items = ["Pizza", "Pasta", "Burger"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restaurant Menu")),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(items[index], style: TextStyle(fontSize: 20)),
                        Text("Price: 100"),
                        ElevatedButton(onPressed: () {}, child: Text("Order"))
                      ],
                    )
                );
              },
            );
          },
      ),
    );
  }
}
