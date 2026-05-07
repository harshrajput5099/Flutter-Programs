import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'text_provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TextProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Center(
        child: Text(
          data.text,
          style: TextStyle(fontSize: 40),
        )
      ),
    );
  }
}