import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameEditingController = TextEditingController();
    var descEditingController = TextEditingController();
    var placeEditingController = TextEditingController();
    return Scaffold(
        appBar: AppBar(title: Text("Add Page")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Enter item name"),
                controller: nameEditingController,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Enter item description"),
                controller: descEditingController,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Enter item place"),
                controller: placeEditingController,
              ),
              TextButton(
                  onPressed: () {
                    var newItem = {
                      "name": nameEditingController.text,
                      "desc": descEditingController.text,
                      "place": placeEditingController.text
                    };
                    print(newItem);
                    // Close this page and pass the newItem forward
                    Navigator.pop(context,newItem);
                  },
                  child: Text("Add new Item"))
            ],
          ),
        ));
  }
}
