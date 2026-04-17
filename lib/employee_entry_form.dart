import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmployeeForm(),
    );
  }
}

class EmployeeForm extends StatefulWidget {
  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final name = TextEditingController();
  final id = TextEditingController();
  final dept = TextEditingController();
  final salary = TextEditingController();

  void submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Details(
          name.text,
          id.text,
          dept.text,
          salary.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee Form"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(controller: name, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: id, decoration: InputDecoration(labelText: "ID")),
            TextField(controller: dept, decoration: InputDecoration(labelText: "Dept")),
            TextField(controller: salary, decoration: InputDecoration(labelText: "Salary")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: submit, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String name, id, dept, salary;

  Details(this.name, this.id, this.dept, this.salary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Name: $name\nID: $id\nDept: $dept\nSalary: $salary",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}