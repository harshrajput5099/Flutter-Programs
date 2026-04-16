import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<String> cartItems = [];

  final List<Map<String, String>> products = [
    {"name": "Shoes", "price": "₹1999"},
    {"name": "T-Shirt", "price": "₹499"},
    {"name": "Watch", "price": "₹2999"},
    {"name": "Bag", "price": "₹999"},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addToCart(String product) {
    setState(() {
      cartItems.add(product);
    });
  }

  Widget getScreen() {
    if (_selectedIndex == 0) {
      return HomeScreen(products: products, onAdd: addToCart);
    } else if (_selectedIndex == 1) {
      return CartScreen(cartItems: cartItems);
    } else {
      return ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping App"),
      ),
      body: getScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// ---------------- HOME ----------------
class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function(String) onAdd;

  HomeScreen({required this.products, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: Text(item["name"]!),
            subtitle: Text(item["price"]!),
            trailing: ElevatedButton(
              onPressed: () => onAdd(item["name"]!),
              child: Text("Add"),
            ),
          ),
        );
      },
    );
  }
}

// ---------------- CART ----------------
class CartScreen extends StatelessWidget {
  final List<String> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return cartItems.isEmpty
        ? Center(child: Text("Cart is empty"))
        : ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(cartItems[index]),
        );
      },
    );
  }
}

// ---------------- PROFILE ----------------
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
          ),
          SizedBox(height: 10),
          Text("John Doe", style: TextStyle(fontSize: 20)),
          Text("johndoe@email.com"),
        ],
      ),
    );
  }
}