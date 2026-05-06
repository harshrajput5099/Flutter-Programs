import 'package:exam_practice/banking_app_ui_simple.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Center(child: Text("${counter.count}")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: counter.increment, child: Icon(Icons.add)),
          SizedBox(height: 10),
          FloatingActionButton(onPressed: counter.decrement, child: Icon(Icons.remove))
        ],
      ),
    );
  }
}