import 'package:flutter/material.dart';
import 'db_helper.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  List notes = [];

  void loadData() async {
    notes = await DBHelper.getAll();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
      ),

      body: Column(
        children: [

          TextField(
            controller: title,
            decoration: InputDecoration(
              hintText: "Title",
            ),
          ),

          TextField(
            controller: desc,
            decoration: InputDecoration(
              hintText: "Description",
            ),
          ),

          ElevatedButton(
            onPressed: () async {

              await DBHelper.insert(
                title.text,
                desc.text,
              );

              title.clear();
              desc.clear();

              loadData();
            },

            child: Text("Add"),
          ),

          Expanded(
            child: ListView.builder(

              itemCount: notes.length,

              itemBuilder: (context, index) {

                return ListTile(

                  title: Text(
                    notes[index]['title'],
                  ),

                  subtitle: Text(
                    notes[index]['description'],
                  ),

                  trailing: IconButton(

                    icon: Icon(Icons.delete),

                    onPressed: () async {

                      await DBHelper.delete(
                        notes[index]['id'],
                      );

                      loadData();
                    },
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