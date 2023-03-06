import 'package:flutter/material.dart';


class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Home Page"),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.lightGreen),
          child: const Center(
            child: Text("Welcome to home page ",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
          ),
        ));
  }
}
