import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen()
    );
  }
}

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email: ${emailcontroller.text}\nPassword: ${passwordcontroller.text}'),
        duration: const Duration(seconds: 10),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            ),

            SizedBox(height: 40,),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
            ),

            SizedBox(height: 40,),
            TextField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: login, child: Text('Login')),
            )


          ],
        ),
      ),
    );
  }


}