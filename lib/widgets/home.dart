import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todos/widgets/detail.dart';
import 'add.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var todos = [

  ];

  // When the page is loaded do the following...
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();

  }

   void loadData() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   var todoTemp = prefs.getString("todos");
   print(todoTemp);
   if (todoTemp != null){
     setState((){
       // Transform String to Map
       todos = jsonDecode(todoTemp);
     });
   }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
                onPressed: () async {
                  final result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPage()));
                  todos.add(result);
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  // Save -> nama file "todos", todos
                  // todos is an Array of Map -> cannot save it directly
                  // Transform Array of Map to String (jsonEncode)
                  prefs.setString("todos", jsonEncode(todos));
                  setState(() {
                    todos;
                  });
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            // how many rows are there?
            itemCount: todos.length,
            // What to show in every row
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(todos[index]["name"]!),
                  subtitle: Text(todos[index]["place"]!),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        // Step 3 : Pass the item
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  todoItem: todos[index],
                                )));
                  });
            }));
  }
}
