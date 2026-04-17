import 'package:flutter/material.dart';

void main() {
  runApp(RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {"name": "Pizza", "price": "₹299"},
    {"name": "Burger", "price": "₹149"},
    {"name": "Pasta", "price": "₹199"},
  ];

  void showItemDetails(BuildContext context, Map<String, String> item) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ICON instead of image
              Center(
                child: Icon(
                  Icons.fastfood,
                  size: 80,
                  color: Colors.orange,
                ),
              ),

              SizedBox(height: 10),

              Text(
                item["name"]!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5),

              Text(
                "Price: ${item["price"]}",
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),

              SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${item["name"]} added to cart")),
                    );
                  },
                  child: Text("Add to Cart"),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant Menu"),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];

          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.fastfood, color: Colors.orange),
              title: Text(item["name"]!),
              subtitle: Text(item["price"]!),
              onTap: () => showItemDetails(context, item),
            ),
          );
        },
      ),
    );
  }
}