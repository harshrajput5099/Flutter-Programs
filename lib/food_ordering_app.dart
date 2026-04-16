import 'package:flutter/material.dart'; // For Bottom Sheet and ListView

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodListScreen(),
    );
  }
}

class FoodListScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      "name": "Pizza",
      "price": "₹299",
      "description": "Delicious cheesy pizza with fresh toppings."
    },
    {
      "name": "Burger",
      "price": "₹149",
      "description": "Juicy burger with crispy patty and sauces."
    },
    {
      "name": "Pasta",
      "price": "₹199",
      "description": "Creamy white sauce pasta with veggies."
    },
    {
      "name": "Sandwich",
      "price": "₹99",
      "description": "Healthy grilled sandwich with fillings."
    },
  ];

  void showFoodDetails(BuildContext context, Map<String, String> food) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food["name"]!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                food["price"]!,
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              SizedBox(height: 10),
              Text(food["description"]!),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${food["name"]} ordered!")),
                    );
                  },
                  child: Text("Order Now"),
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
        title: Text("Food Menu"),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final food = foodItems[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(food["name"]!),
              subtitle: Text(food["price"]!),
              onTap: () => showFoodDetails(context, food),
            ),
          );
        },
      ),
    );
  }
}
