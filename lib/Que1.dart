import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VisitingCard(),
    );
  }
}

class VisitingCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 50, color: Colors.deepOrange,),
              ),
              SizedBox(height: 20,),
              Text(
                'HarshSinh Tomar',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              SizedBox(height: 6,),
              Text(
                'Student',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              SizedBox(height: 6,),
              Divider(height: 20, thickness: 2, color: Colors.black,),
              SizedBox(height: 6,),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.green,),
                  SizedBox(width: 15,),
                  Text('harshxyz@gmail.com'),
                ],
              ),
              SizedBox(height: 6,),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.green,),
                  SizedBox(width: 15,),
                  Text('8866442200'),
                ],
              ),
              SizedBox(height: 6,),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green,),
                  SizedBox(width: 15,),
                  Text('Ahmedabad, Gujarat'),
                ],
              ),
              SizedBox(height: 6,),
              Row(
                children: [
                  Icon(Icons.language, color: Colors.green,),
                  SizedBox(width: 15,),
                  Text('www.harsha.dev'),
                ],
              ),
              SizedBox(height: 6,),
            ],
          ),
        ),
      ),
    );
  }
}