import 'package:flutter/material.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget {
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

  List<Map<String, String>> accounts = [
    {"type": "Savings Account", "balance": "₹25,000", "number": "XXXX1234"},
    {"type": "Current Account", "balance": "₹1,20,000", "number": "XXXX5678"},
    {"type": "Salary Account", "balance": "₹45,000", "number": "XXXX9012"},
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showAccountDetails(BuildContext context, Map<String, String> acc) {
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
              Text(acc["type"]!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Account No: ${acc["number"]}"),
              Text("Balance: ${acc["balance"]}"),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close"),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget getScreen() {
    if (_selectedIndex == 0) {
      return Center(child: Text("Welcome to Banking App"));
    } else if (_selectedIndex == 1) {
      return ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          final acc = accounts[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(acc["type"]!),
              subtitle: Text(acc["balance"]!),
              onTap: () => showAccountDetails(context, acc),
            ),
          );
        },
      );
    } else {
      return Center(child: Text("More Options"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banking App"),
        centerTitle: true,
      ),
      body: getScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: "Accounts"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
    );
  }
}