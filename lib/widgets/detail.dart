import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // 1) Create a variable that will store the item passed from first page
  final todoItem;
  //2) Create a constructor that will receive the variable
  DetailPage({required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("Detail")),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text(todoItem["name"], style: TextStyle(fontSize: 32, color: Colors.red),),
                SizedBox(height: 8,),
                Text(todoItem["place"], style: TextStyle(fontSize: 20, color: Colors.blue)),
                SizedBox(height: 8,),
                Text(todoItem["desc"],style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        )
    );
  }
}
