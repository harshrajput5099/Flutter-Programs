import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController controller = TextEditingController();
  List<String> tasks = [];

  // Add Task
  void addTask() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      tasks.add(controller.text.trim());
      controller.clear();
    });
  }

  // Delete Task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Task deleted")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do App"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // Input Section
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: "Enter task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addTask,
                  child: Text("Add"),
                ),
              ],
            ),
          ),

          // Task List
          Expanded(
            child: tasks.isEmpty
                ? Center(
              child: Text(
                "No tasks added",
                style: TextStyle(fontSize: 16),
              ),
            )
                : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(tasks[index]),

                    // Delete on long press
                    onLongPress: () => deleteTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}