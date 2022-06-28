import 'package:flutter/material.dart';
import 'package:todos/widgets/detail.dart';
import 'add.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var todos = [
    {"name":"Dinner","place":"Horizon Garden","desc":"Budget under 100 for 3 ppl"},
    {"name":"Play PS5","place":"Office","desc":"Play Fifa, WWE and Just Dance"},
    {"name":"Study pdf","place":"Home","desc":"Study chapter 2 and 3"},
    {"name":"Fix bug","place":"office","desc":"Fix bugs with developers"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Home"), actions: [
        IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>AddPage())
          );

        }, icon: Icon(Icons.add))
      ],),
      body:ListView.builder(
          padding: const EdgeInsets.all(8),
          // how many rows are there?
          itemCount: todos.length,
          // What to show in every row
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title:Text(todos[index]["name"]!),
              subtitle: Text(todos[index]["place"]!),
              trailing: Icon(Icons.chevron_right),
              onTap:(){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>DetailPage())
                );
              }
            );
          }
      )
    );
  }
}
